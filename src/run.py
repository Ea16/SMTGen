import argparse
import datetime
import os
import importlib

from reduce import reduce_seed

def generate_formulas(generator_module, args):
    """Generate SMT formulas"""
    print("Start generating formulas:", datetime.datetime.now())
    os.makedirs(args.out, exist_ok=True)

    generated_files = []
    gmodel = generator_module.gmodel

    for i in range(args.num):
        filename = os.path.join(args.out, f"seed_{i}.smt2")
        r = gmodel()
        r.modeltree(args.terms, args.models)
        r.tosmt(filename)
        generated_files.append(filename)

    print(f"Generated {args.num} formulas, saved in {args.out}")
    return generated_files


def run_reduction(generator_module, input_file):
    """Perform reduction on the generated SMT file"""
    seed = reduce_seed(generator_module)
    seed.readfile.readf(input_file)

    index = 0
    base_name = input_file.replace(".smt2", "")

    while True:
        aftername = f"{base_name}_reduced_{index}.smt2"
        index += 1

        seed.reduce_cons(seed.readfile.cons, seed.readfile.model)
        seed.readfile.model.tosmt(aftername)
        print(f"Reduced file saved: {aftername}")

        if len(seed.readfile.model.zlist) <= 1:
            break

        seed = reduce_seed(generator_module)
        seed.readfile.readf(aftername)


def main(args):
    # load module by theory
    if args.theory == "real":
        generator = importlib.import_module("generator_real")
    elif args.theory == "fp":
        generator = importlib.import_module("generator_fp")
    elif args.theory == "bv":
        generator = importlib.import_module("generator_bv")
    else:
        raise ValueError(f"Unknown theory: {args.theory}, choose from real/fp/bv")

    # generate formulas
    generated_files = generate_formulas(generator, args)

    # optional reduction
    if args.reduction:
        print("Reduction enabled. Start reducing formulas...")
        for f in generated_files:
            run_reduction(generator, f)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="AutoSMTGen Formula Generator with Reduction")
    parser.add_argument("--num", type=int, default=10, help="Number of formulas to generate")
    parser.add_argument("--out", type=str, default="SMT-generation", help="Output directory")
    parser.add_argument("--terms", type=int, default=30, help="Number of terms")
    parser.add_argument("--models", type=int, default=100, help="Number of models")
    parser.add_argument("--theory", type=str, default="bv", choices=["real", "fp", "bv"], help="Choose theory type")
    parser.add_argument("--reduction", action="store_true", help="Enable reduction after generation")

    args = parser.parse_args()
    main(args)
