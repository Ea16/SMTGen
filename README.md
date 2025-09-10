
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
python run.py --num 10 --theory bv --out SMT-generation --terms 30 --models 100
````

Arguments:

* `--num` : number of formulas to generate (default `1000`)
* `--theory` : theory type, choose from `real`, `fp`, `bv`
* `--out` : output directory (default `SMT-generation`)
* `--terms` : number of terms per formula (default `50`)
* `--models` : number of models per formula (default `100`)

Example:

```bash
python run.py --num 5 --theory fp --out results_fp --terms 20 --models 50
```

This will generate 5 floating-point (QF\_FP) formulas in `results_fp/`.

---

### 2. Enable Reduction (Optional)

You can enable formula reduction directly after generation:

```bash
python run.py --num 5 --theory bv --out reduced_bv --terms 30 --models 100 --reduce
```

This will:

1. Generate formulas.
2. Run reduction on each formula.
3. Save reduced formulas in the same output directory.

---

## LLM-based Hard Pattern Extraction

Note: This repository does not include the LLM-based pattern extraction module.

Reasons:

1. The module relies on external APIs (e.g., OpenAI/Claude), which incur usage costs and require API keys.
2. LLM outputs are non-deterministic and may vary across versions, which affects reproducibility.
3. The LLM component is only an optional extension. The core contributions of AutoSMTGen — formula generation and reduction — are fully reproducible with the provided code.

If you wish to extend AutoSMTGen with LLM-based analysis:

* Use the reduced formulas from `reduce.py`.
* Provide them as prompts to your LLM of choice.
* Example pseudo-code:

```python
from openai import OpenAI
client = OpenAI(api_key="YOUR_API_KEY")

formula = open("reduced_bv/seed_0.smt2").read()
response = client.chat.completions.create(
    model="gpt-4",
    messages=[
        {"role": "system", "content": "Analyze SMT formulas"},
        {"role": "user", "content": f"Find hard-to-solve patterns:\n{formula}"}
    ]
)
print(response.choices[0].message.content)
```

---

## Citation

If you use AutoSMTGen in your research, please cite:

```
[Your paper citation here]
```

---

## License

MIT License. See [LICENSE](LICENSE) for details.

```

要不要我再帮你在 `Usage` 前面加一个 **Quick Start** 小节，比如 `git clone` + `cd src` + `python run.py` 的示例？这样审稿人或 GitHub 用户能一键复现。
```
