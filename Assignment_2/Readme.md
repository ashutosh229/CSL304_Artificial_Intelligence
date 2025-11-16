# AI Assignment 2

This repository contains solutions for Assignment 2 of the Artificial Intelligence course. Below are the instructions for testing and running each problem solution.

---

## Problem 1

### Testing Instructions
```bash
python -m Problem_1.entry
```

This will execute the solution for Problem 1. Ensure you are in the root directory before running the command.

---

## Problem 2:

### Solution Components
- **Proof Images**: Visual proofs are included as image files in the problem directory
- **Prolog File**: Logic program implementation (`.pl` file)

### Testing Instructions
1. Open the `.pl` file using the Prolog Software
2. Load the file into the Prolog interpreter
3. Query the predicates as demonstrated in the proof images
4. The images provide reference outputs for verification

---

## Problem 3:

### Prerequisites
- Python virtual environment (already included in the folder)
- Required packages listed in `requirements.txt`

### Testing Instructions

1. **Activate the virtual environment:**
```bash
   # On Windows
   venv\Scripts\activate
   
   # On macOS/Linux
   source venv/bin/activate
```

2. **Install dependencies:**
```bash
   pip install -r requirements.txt
```

3. **Run the solution:**
   - Open the Jupyter notebook file: `solution.ipynb`
   - Select the kernel: **venv_problem_3**
   - Execute all cells sequentially to view the complete solution
   
4. **Output:**
   - Generated files and results are saved in the `content/` directory

---

## Problem 4:

### Solution Components
- **Domain file**: PDDL domain definition
- **Problem file**: PDDL problem specification
- **Plan file**: Generated solution plan (`.txt` format)
- **Report**: Detailed documentation of the problem-solving approach and steps

### Testing Instructions
1. Review the domain and problem files to understand the planning scenario
2. Open the plan `.txt` file to view the generated solution sequence
3. Refer to the report for:
   - Problem analysis
   - Solution methodology
   - Step-by-step explanation of the planning process

**Note**: The plan was generated using a PDDL solver. To regenerate the plan, use any standard PDDL planner with the provided domain and problem files.

---

## General Notes

- Ensure all required software and dependencies are installed before testing
- Each problem solution is self-contained within its respective directory

---

**Course**: Artificial Intelligence  
**Assignment**: 2  
**Submission Date**: 16/11/2025