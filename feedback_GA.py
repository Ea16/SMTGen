import numpy as np
import generator_bv
import random
import z3_GA_time
from z3 import *
import readfile
from bayes_opt import BayesianOptimization


class Pre_GA:
    def __init__(self,seeds_num,cons_num):
        self.eq_num=cons_num
        self.seeds_num=seeds_num

    def getop(self,cons,isBool):
        boolop=generator_bv.boolOutOp
        if isBool:
            return boolop[np.random.randint(0,len(boolop))]
        else:
            rand=None
            while True:
                rand=cons.random_op()
                if rand not in boolop:
                    break
            return rand
        
    def gcons(self,cons,store_cons,store_vars,isBool):
        inlist=cons.inlist[:]
        outlist=cons.outlist[:]
        varindex=cons.index
        vars_copy=cons.inlist[:]+cons.outlist[:]
        node=None
        while True:
            rand=self.getop(cons,isBool)
            cons.addnode(rand,True,vars_copy)
            node=cons.op[-1]
            vars_item=set()
            cons_item=set()
            for i in range(len(node.input)):
                vars_item.add(node.input[i].name)
                cons_item.add(node.input[i].name)
            cons_item.add(node.name)
            if cons_item in store_cons or vars_item in store_vars:
                cons.op=cons.op[:-1]
                cons.inlist=inlist[:]
                cons.outlist=outlist[:]
                cons.index=varindex
            else:
                break
        return node,cons_item,vars_item

    def gType(self):
        r=random.random()
        isBool=False
        if r>=0.8:
            isBool=True
        return isBool
    
    def gmodel(self,filename):
        store_cons=[]
        store_vars=[]
        model=generator_bv.gmodel()
        for _ in range(self.eq_num):
            znode=model.znode()
            znode.name="z_"+str(model.zindex)
            model.zindex+=1
            isBool=self.gType()
            node,cons_item,vars_item=self.gcons(model.cons,store_cons,store_vars,isBool)
            store_cons.append(cons_item)
            store_vars.append(vars_item)
            znode.input1=node.output
            node,cons_item,vars_item=self.gcons(model.cons,store_cons,store_vars,isBool)
            store_cons.append(cons_item)
            store_vars.append(vars_item)
            znode.input2=node.output
            model.zlist.append(znode)
        allOut=model.zlist[:]+model.modelop[:]
        while len(allOut)>1:
            mnode=model.addopt(allOut)
            allOut.append(mnode)
        model.tosmt(filename)
    
    def run(self):
        i=0
        while i<self.seeds_num:
            # filename="SMT-generator/seeds_GA/seed_"+str(i)+".smt2"
            filename="example.smt2"
            self.gmodel(filename)
            time,res=z3_GA_time.gtime(filename)
            print(str(time)+"\n"+str(res==sat))
            if res==sat and 50<time<61:
                i+=1
                # f=open("SMT-generator/data/GA_time.txt","a")
                # f.write(filename+"\t"+str(time)+"\n")
                # f.close()
    
class enode:
    def __init__(self):
        self.file=""
        self.varsnum=0
        self.consnum=0
        self.height=0
        self.time=0
        self.score=0

class GA:
    def __init__(self,number,generator):
        self.filelist=[]
        self.index=number
        self.generator=generator
    
    def gfiles(self,name):
        with open(name,"r") as fs:
            for line in fs:
                line=line.strip()
                tokens=line.split()
                filename=tokens[0]
                time=float(tokens[1])
                if 30<time<61:
                    f=enode()
                    f.file=filename
                    f.time=time
                    f.score=self.cal_complexity(f)
                    self.filelist.append(f)

        
    def cal_complexity(self,f,vp=0.12,cp=0.08,hp=0.2,tp=0.6):
        r=readfile.readfile(generator_bv)
        nodelist=dict()
        r.readf(f.file)
        hmax=0
        vars_num=len(r.cons.inlist+r.cons.outlist)
        cons_num=len(r.cons.outlist)
        r.cons.op.sort(key=lambda x:int(x.output.name[(x.output.name.find('_')+1):]))
        f.varsnum=vars_num
        f.consnum=cons_num
        for node in r.cons.inlist:
            nodelist[node]=0
        for op in r.cons.op:
            node=op.output
            height=nodelist.get(node,0)
            for inp in op.input:
                height=max(height,nodelist.get(inp)+1)
            nodelist[node]=height
            hmax=max(hmax,height)
        f.height=hmax
        return vp*vars_num+cp*cons_num+hp*hmax+tp*f.time
    
    def roulette_wheel(self,targetfiles,num):
        t_score=sum(file.score for file in targetfiles)
        s=[]

        for _ in range(num):
            if random.random()<0.1:
                rand=random.choice(targetfiles)
                s.append(rand)
                targetfiles.remove(rand)
                continue
            # roulette wheel
            pick = random.uniform(0, t_score)  # choose between [0, all] 
            current = 0
        
            for file in targetfiles:
                current += file.score
                if current >= pick:
                    s.append(file)
                    targetfiles.remove(file)
                    t_score-=file.score ##delete score
                    break
        return s
    
    def selectSeeds(self,num):
        s_seeds=self.roulette_wheel(self.filelist[:],num)
        return s_seeds
    
    def gindex(self,name,oplist):
        for i in range(len(oplist)):
            if oplist[i].output.name==name:
                return i
        return -1
    
    def ginput(self,name,vars):
        for node in vars:
            if node.name==name:
                return node
        return None
    
    def crossoverSeeds(self,file1,file2):
        r1=readfile.readfile(self.generator)
        r1.readf(file1)
        r2=readfile.readfile(self.generator)
        r2.readf(file2)
        cons_length=min(len(r1.cons.outlist),len(r2.cons.outlist))
        s_index=np.random.randint(0.5*cons_length,cons_length)
        s1=set()
        s2=set()
        for i in range(s_index,cons_length):
            tempi=r1.cons.outlist[i].name.find('_')+1
            s1.add(int(r1.cons.outlist[i].name[tempi:]))
            tempi=r2.cons.outlist[i].name.find('_')+1
            s2.add(int(r2.cons.outlist[i].name[tempi:]))
        union=list(s1&s2)
        for i in range(len(union)):
            target="bv_"+str(union[i])
            index1=self.gindex(target,r1.cons.op)
            index2=self.gindex(target,r2.cons.op)
            op1=r1.cons.op[index1]
            op2=r2.cons.op[index2]
            after_op1=generator_bv.gconstrains.consop()
            after_op2=generator_bv.gconstrains.consop()
            after_op1.name,after_op2.name=op2.name,op1.name
            after_op1.name_num,after_op2.name_num=op2.name_num,op1.name_num
            after_op1.extend,after_op2.extend=op2.extend,op1.extend
            after_op1.i,after_op2.i=op2.i,op1.i
            after_op1.j,after_op2.j=op2.j,op1.j
            after_op1.output,after_op2.output=op2.output,op1.output
            for node in op1.input:
                inp=self.ginput(node.name,r1.cons.outlist+r1.cons.inlist)
                after_op2.input.append(inp)
            for node in op2.input:
                inp=self.ginput(node.name,r2.cons.outlist+r2.cons.inlist)
                after_op1.input.append(inp)
            r1.cons.op[index1]=after_op1
            r2.cons.op[index2]=after_op2
        return r1,r2
    
    def update(self,filename):
        r=readfile.readfile(self.generator)
        r.readf(filename)
        store_vars=[]
        vars=r.cons.inlist[:]+r.cons.outlist[:]
        for node in r.cons.op:
            iscompa=True# check formula
            vars_item=set()
            inp_num=len(node.input)
            for i in range(inp_num):
                vars_item.add(node.input[i].name)
                if node.input[i].isBool:
                    iscompa=False
            if node.output.isBool and node.name_num not in generator_bv.boolOutOp:
                iscompa=False
            if not node.output.isBool and node.name_num in generator_bv.boolOutOp:
                iscompa=False
            while vars_item in store_vars or not iscompa:
                tempi=node.output.name.find('_')+1
                index=int(node.output.name[tempi:])
                vars_copy=[n for n in vars if int(n.name[(n.name.find('_')+1):])<index and not n.isBool]
                inps=random.sample(vars_copy,inp_num)
                node.input=inps[:]
                if inp_num==2 and node.input[0].length!=node.input[1].length and node.name not in generator_bv.lagerOp:
                    node.extend=abs(node.input[0].length-node.input[1].length)
                r.cons.outlist.remove(node.output)
                temp_index=r.cons.index
                r.cons.index=int(node.output.name[(node.output.name.find('_')+1):])
                r.cons.gOut(node)
                r.cons.outlist.append(node.output)
                r.cons.index=temp_index
                iscompa=True
                vars_item=set()
                for i in range(inp_num):
                    vars_item.add(node.input[i].name)
            store_vars.append(vars_item)
        r.model=self.generator.gmodel()
        r.model.cons=r.cons
        ###regeneration 
        cons=r.cons.outlist[:]
        for i in range(len(cons)):
            r.model.gznode(cons)
        allOut=r.model.zlist[:]+r.model.modelop[:]
        while len(allOut)>1:
            mnode=r.model.addopt(allOut)
            allOut.append(mnode)
        return r
    
    def mutate(self,filename):
        r=readfile.readfile(self.generator)
        r.readf(filename)
        store_vars=[]
        vars=r.cons.inlist[:]+r.cons.outlist[:]
        node=random.choice(r.cons.op[1:])
        r.cons.op.remove(node)
        r.cons.outlist.remove(node.output)
        inlist=r.cons.inlist[:]
        outlist=r.cons.outlist[:]
        for n in r.cons.op:
            vars_item=set()
            inp_num=len(n.input)
            for i in range(inp_num):
                vars_item.add(n.input[i].name)
            store_vars.append(vars_item)
        node_index=int(node.output.name[(node.output.name.find('_')+1):])
        vars_copy=[n for n in vars if int(n.name[(n.name.find('_')+1):])<node_index]
        temp_index=r.cons.index
        r.cons.index=node_index
        while True:
            rand=Pre_GA(100,15).getop(r.cons,node.output.isBool)
            r.cons.addnode(rand,True,vars_copy)##index error
            node=r.cons.op[-1]
            vars_item=set()
            for i in range(len(node.input)):
                vars_item.add(node.input[i].name)
            if vars_item in store_vars:
                r.cons.op=r.cons.op[:-1]
                r.cons.inlist=inlist[:]
                r.cons.outlist=outlist[:]
                r.cons.index=node_index
            else:
                break
        r.cons.index=temp_index
        r.cons.op.sort(key=lambda x:int(x.output.name[(x.output.name.find('_')+1):]))
        r.cons.outlist.sort(key=lambda x:int(x.name[(x.name.find('_')+1):]))
        return r


    def run(self,p_size,m_rate,c_rate,gene_num):
        p_size=int(p_size)
        gene_num=int(gene_num)

        for _ in range(gene_num):
            s_seeds=self.selectSeeds(p_size)
            num=len(s_seeds)
            for _ in range(num//2):
                #if random.random()<c_rate:
                    p1,p2=random.sample(s_seeds,2)
                    s_seeds.remove(p1)
                    s_seeds.remove(p2)
                    r1,r2=self.crossoverSeeds(p1.file,p2.file)
                    afterp1=enode()
                    afterp2=enode()
                    filename1=p1.file.replace(".smt2", "")
                    filename1=filename1+"_"+str(self.index)+".smt2"
                    self.index+=1
                    afterp1.file=filename1
                    filename2=p2.file.replace(".smt2", "")
                    filename2=filename2+"_"+str(self.index)+".smt2"
                    self.index+=1
                    afterp2.file=filename2
                    r1.model.tosmt(afterp1.file)
                    r2.model.tosmt(afterp2.file)
                    r1=self.update(afterp1.file)
                    r2=self.update(afterp2.file)
                    r1.model.tosmt(afterp1.file)
                    r2.model.tosmt(afterp2.file)
                    if random.random()<m_rate:
                        r1=self.mutate(afterp1.file)
                        r1.model.tosmt(afterp1.file)
                    if random.random()<m_rate:
                        r2=self.mutate(afterp2.file)
                        r2.model.tosmt(afterp2.file)
                    afterp1.time,res1=z3_GA_time.gtime(afterp1.file)
                    print(afterp1.time)
                    afterp2.time,res2=z3_GA_time.gtime(afterp2.file)
                    print(afterp2.time)
                    f=open("SMT-generator/data/GA_time.txt","a")
                    f.write(afterp1.file+"\t"+str(afterp1.time)+"\n")
                    f.write(afterp2.file+"\t"+str(afterp2.time)+"\n")
                    f.close()
                    if afterp1.time>30:
                        afterp1.score=self.cal_complexity(afterp1)
                        self.filelist.append(afterp1)
                    if afterp2.time>30:
                        afterp2.score=self.cal_complexity(afterp2)
                        self.filelist.append(afterp2)
                    



if __name__=="__main__":
    # seed_GA=Pre_GA(1,15)
    # seed_GA.run()
    ga=GA(351,generator_bv)
    ga.gfiles("SMT-generator/data/GA_time.txt")
    ga.run(30,0.05,1,100)
    #r=ga.mutate("SMT-generator/seeds_GA/seed_52_109.smt2")
    #r.model.tosmt("example.smt2")
    #time,res=z3_GA_time.gtime("SMT-generator/seeds_GA/seed_36_108.smt2")
    #print(time)
        
        
    


    





            
                


