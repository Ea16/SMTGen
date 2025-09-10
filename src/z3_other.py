
import subprocess
import time
from multiprocessing import Pool, freeze_support
import numpy as np
import generator_bv
import shutil
import os

def solve_smt2_file(smt2_filename):
    try:
        #
        #command = ["E:/SMT/mathsat/bin/mathsat.exe", smt2_filename]
        #command = ["D:/Downloads/yices-2.6.5-x86_64-unknown-mingw32-static-gmp/yices-2.6.5/bin/yices-smt2.exe", smt2_filename]
        command = ["D:/Downloads/cvc5-Win64-x86_64-static", smt2_filename]
        result = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

        if result.returncode == 0:
            return True, result.stdout
        else:
            return False, result.stderr
    except Exception as e:
        return False, str(e)
    
def timeout_check_smt_file(filename):
    with Pool(processes=1) as pool:
        try:
            res = pool.apply_async(solve_smt2_file, (filename,))
            return res.get(timeout=60)
        except:
            return None

def gtime(filename):
    start = time.time()
    res = timeout_check_smt_file(filename)
    end = time.time()
    if res is not None:
        solve_time = end - start
        return solve_time
    else:
        return 60

