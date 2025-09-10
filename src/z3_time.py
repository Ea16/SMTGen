import time
from z3 import *
from multiprocessing import Pool
from multiprocessing import freeze_support
import inspect

def check_smt_file(filename):
    s = Solver()
    with open(filename, 'r') as f:
        s.from_string(f.read())
    try:
        res = s.check()
        source_code = inspect.getsource(check_smt_file)
        print(source_code)
        signature = inspect.signature(check_smt_file)
        print(signature)
        frame = inspect.currentframe()
        print(frame.f_code.co_name)
        return res
    except:
        return None
    
def timeout_check_smt_file(filename):
    with Pool(processes=1) as pool:
        try:
            res = pool.apply_async(check_smt_file, (filename,))
            return res.get(timeout=60)#1min
        except:
            return None
        
freeze_support()
def gtime(filename):
     
    start = time.time()
    res = timeout_check_smt_file(filename)
    end = time.time()
    if res is not None:
        solve_time=end-start
        return solve_time
    else:
        return 60
    
    
