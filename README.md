
# AutoSMTGen

AutoSMTGen is an SMT formula generation and reduction framework.  
It can generate formulas across multiple background theories and optionally reduce them to expose hard-to-solve patterns.  

---

## Project Structure

```

src/
│── generator\_bv.py        # Formula generator for QF\_BV
│── generator\_fp.py        # Formula generator for QF\_FP
│── generator\_real.py      # Formula generator for QF\_NRA
│── readfile.py            # File reader utilities
│── reduce.py              # Reduction framework
│── run.py                 # Main entry point (command line interface)
│── feedback\_GA.py         # GA-based feedback generator
│── z3\_time.py             # Solver runtime measurement
│── z3\_GA\_time.py
│── z3\_other.py

````

---

## Usage

### 1. Generate Formulas

```bash
python run.py --num --theory --out --terms --models 
````

Arguments:

* `--num` : number of formulas to generate (default `1000`)
* `--theory` : theory type, choose from `real`, `fp`, `bv`
* `--out` : output directory (default `SMT-generation`)
* `--terms` : number of terms per formula (default `50`)
* `--models` : number of models per formula (default `100`)

Example:

```bash
python run.py --num 100 --theory fp --out results_fp --terms 30 --models 50
```

This will generate 100 floating-point (QF\_FP) formulas in `results_fp/`.

---

### 2. Enable Reduction (Optional)

You can enable formula reduction directly after generation:

```bash
python run.py --num 5 --theory bv --out reduced_bv --terms 30 --models 100 --reduction
```

## Scope of This Repository

This repository can generate formulas across multiple background theories and reduce them to pinpoint critical constraints. 


The paper also discusses using large language models (LLMs) to extract hard-to-solve patterns.  
However, this functionality is not included in the released code for the following reasons:

1. Running the LLM part requires access to third-party APIs, which cannot be packaged into this repository.  
2. Each query incurs API costs and runtime overhead, which is impractical for open-source release.

Even without the LLM component, the core functionality of the framework is fully reproducible with the provided code. For researchers who wish to extend AutoSMTGen with LLM-based analysis, they can make use of the prompts described in our paper together with their own LLM to extract or classify hard-to-solve patterns.


---


