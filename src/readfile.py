import numpy as np
import random
import generator_bv
import generator_fp
import generator_real

var_start=("bv_","fp_","real_")
keywords={"bv_","fp_","real_","z_"}

class readfile:
    def __init__(self,generator):
        self.generator=generator
        self.cons=generator.gconstrains()
        self.model=generator.gmodel()
        self.varall=[None]*1000
    
    def getvar(self,tokens):
        if tokens[1].startswith("bv_"):
            var=self.generator.bv()
            if tokens[-1]=="Bool":
                var.isBool=True
                var.length=1
            else:
                var.length=int(tokens[-1])
        elif tokens[1].startswith("fp_"):
            var=self.generator.fp_var()
            if tokens[-1]=="Bool":
                var.isBool=True
                var.length=1
            else:
                var.length=int(tokens[-1])+int(tokens[-2])
        else:
            var=self.generator.real()
        var.name=tokens[1]
        tempi=tokens[1].find('_')+1
        index=int(tokens[1][tempi:])
        return var,index
    
    def getkey(self,name,length):
        if name=="-" and length==1:
            return 1
        elif name=="-" and length==2:
            return 2
        elif name=="+":
            return 3
        elif name=="*":
            return 4
        elif name=="/":
            return 5
        elif name=="<=":
            return 6
        elif name==">=":
            return 7
        elif name=="<":
            return 8
        elif name==">":
            return 9
    
    def getcons(self,tokens):
        node=self.cons.consop()
        varlist=[item for item in tokens if any(keyword in item for keyword in keywords)]
        for i in range(len(varlist)):
            tempi=varlist[i].find('_')+1
            index=int(varlist[i][tempi:])
            if i==0:
                node.output=self.varall[index]
            else:
                node.input.append(self.varall[index])
        self.cons.outlist.append(node.output)

        if tokens[2].startswith("bv_"):
            if tokens[4]=="extract":
                node.name=tokens[4]
                node.i=int(tokens[6])
                node.j=int(tokens[5])
            else:
                node.name=tokens[3]
            node.name_num=self.generator.opt[node.name].value
            if "zero_extend" in tokens: 
                node.extend=abs(node.input[0].length-node.input[1].length)
            
        elif tokens[2].startswith("fp_"):
            index=tokens[3].find('.')+1
            node.name=tokens[3][index:]
            node.name_num=self.generator.opt[node.name].value
            if not tokens[4].startswith("fp_"):
                node.roundingmode=tokens[4]
        elif tokens[2].startswith("real_"):
            node.name=tokens[3]
            node.name_num=self.getkey(tokens[3],len(node.input))
        return node
    
    def getinput(self,s):
        input=None
        if s.startswith("z_"):
            for node in self.model.zlist:
                if node.name==s:
                    input=node
                    break
        else:
            for node in self.model.modelop:
                if node.output==s:
                    input=node
                    break
        return input
    def readf(self,filename):
        with open(filename,"r") as file:
            for line in file:
                line=line.strip()
                tokens = line.split()
                tokens = [token.replace("(", "").replace(")", "") for token in tokens]
                if tokens[0]=="declare-const" and tokens[1].startswith(var_start):
                    var,index=self.getvar(tokens)
                    self.varall[index]=var
                    self.cons.index=index+1
                elif tokens[0]=="assert" and tokens[2].startswith(var_start):
                    node=self.getcons(tokens)
                    self.cons.op.append(node)

                elif tokens[0]=="assert" and tokens[2].startswith("z_"):
                    znode=self.model.znode()
                    varlist=[item for item in tokens if any(keyword in item for keyword in keywords)]
                    for i in range(len(varlist)):
                        tempi=varlist[i].find('_')+1
                        index=int(varlist[i][tempi:])
                        if varlist[i].startswith("z_"):
                            znode.name=varlist[i]
                            self.model.zindex=index+1
                        elif i!=len(varlist)-1:
                            znode.input1=self.varall[index]
                        else:
                            znode.input2=self.varall[index]
                    self.model.zlist.append(znode)

                elif any(keyword in tokens for keyword in {"and","or","not"}):
                    tokens=line.split()
                    operators=[operator for operator in tokens if operator in ["not","and","or"]]
                    length=len(operators)
                    stack=[]
                    for token in tokens:
                        if length:
                            if token==")":
                                clause=""
                                mnode=self.model.gmop()
                                while stack and stack[-1]!="(":
                                    s=stack.pop()
                                    if s in operators:
                                        mnode.name=s
                                    if s.startswith("z_") or s.startswith("("):
                                        input=self.getinput(s)
                                        mnode.input.append(input)
                                    clause=" "+s+clause
                                clause="("+clause+" )"
                                mnode.output=clause
                                self.model.modelop.append(mnode)
                                stack.pop()#pop"("
                                stack.append(clause)
                                length-=1
                            else:
                               stack.append(token)
            for node in self.varall:
                if node not in self.cons.outlist and node is not None:
                    self.cons.inlist.append(node)
            self.model.cons=self.cons
                        




