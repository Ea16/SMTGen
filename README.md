# AutoSMTGen

AutoSMTGen is an SMT formula generation and analysis framework.

Project Structure

src/
 ├── generator_bv.py      # Formula generator for QF_BV
 ├── generator_fp.py      # Formula generator for QF_FP
 ├── generator_real.py    # Formula generator for QF_NRA (real arithmetic)
 ├── readfile.py          # Formula parser
 ├── reduce.py            # Reduction implementation
 ├── run.py               # Main entry point
 ├── feedback_GA.py       # Feedback-guided generator (GA version)
 ├── z3_time.py           # Script for measuring solving time
 ├── z3_GA_time.py        # Script for GA evaluation
 └── z3_other.py          # Other solver utilities


Usage
1. Generate SMT formulas
python run.py --num 5 --theory bv --out SMT-generation


--num : number of formulas to generate (default 10)

--theory : choose from real, fp, bv

--out : output directory (default SMT-generation)

--terms : number of terms in each formula (default 30)

--models : number of models in each formula (default 100)

Example:

python run.py --num 3 --theory fp --terms 50 --models 200 --out out_fp


This will generate 3 formulas in FP theory under the out_fp/ folder.

2. Generate + Reduction

Enable reduction with the --reduction flag:

python run.py --num 2 --theory bv --out out_bv --reduction


This will:

Generate SMT formulas.

Perform iterative reduction on each formula.

Save reduced versions with suffix _reduced_x.smt2.

It can generate formulas in different theories (QF_BV, QF_FP, QF_NRA) and optionally perform constraint reduction to extract hard-to-solve structures.
