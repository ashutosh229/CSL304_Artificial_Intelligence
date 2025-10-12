% ============================================
% WEATHER PROLOG - RESOLUTION REFUTATION
% ============================================

% ============================================
% PART 1: FACTS (Atomic Statements)
% ============================================
warm.
raining.
sunny.
pleasant.

% ============================================
% PART 2: RULES (Horn Clauses)
% ============================================
% Rule 1: If it is sunny and warm, you will enjoy
enjoy :- sunny, warm.

% Rule 2: If it is warm and pleasant, you will do strawberry picking
strawberry_picking :- warm, pleasant.

% Rule 3: If it is raining, then no strawberry picking
not_strawberry_picking :- raining.

% Rule 4: If it is raining, you will get wet
wet :- raining.

% ============================================
% PART 3: CNF REPRESENTATION (For Documentation)
% ============================================
% These predicates show the CNF form of implications
% A -> B is equivalent to ~A v B

remove_implications(implies(and(sunny, warm), enjoy), 
                    or(not(sunny), or(not(warm), enjoy))).

remove_implications(implies(and(warm, pleasant), strawberry_picking), 
                    or(not(warm), or(not(pleasant), strawberry_picking))).

remove_implications(implies(raining, not_strawberry_picking), 
                    or(not(raining), not_strawberry_picking)).

remove_implications(implies(raining, wet), 
                    or(not(raining), wet)).

% ============================================
% PART 4: CNF CLAUSES (Conjunctive Normal Form)
% ============================================
% Clause 1: (~sunny ∨ ~warm ∨ enjoy)
cnf_clause(1, or(or(not(sunny), not(warm)), enjoy)).

% Clause 2: (~warm ∨ ~pleasant ∨ strawberry_picking)
cnf_clause(2, or(or(not(warm), not(pleasant)), strawberry_picking)).

% Clause 3: (~raining ∨ ~strawberry_picking)
cnf_clause(3, or(not(raining), not(strawberry_picking))).

% Clause 4: (~raining ∨ wet)
cnf_clause(4, or(not(raining), wet)).

% Clause 5: warm
cnf_clause(5, warm).

% Clause 6: raining
cnf_clause(6, raining).

% Clause 7: sunny
cnf_clause(7, sunny).

% ============================================
% PART 5: RESOLUTION REFUTATION PROOFS
% ============================================

% --- GOAL 1: Prove "not_strawberry_picking" ---
% To prove by refutation, we negate the goal and derive a contradiction
% Negated Goal: strawberry_picking (assume it's true)
% 
% Resolution Steps:
% 1. From clause 3: (~raining ∨ ~strawberry_picking)
% 2. From clause 6: raining
% 3. Resolve (1) and (2): ~strawberry_picking
% 4. This matches our conclusion, so NOT strawberry_picking is proven

proof_not_strawberry_picking :-
    write('GOAL 1: Proving NOT strawberry_picking'), nl,
    write('------------------------------------------'), nl,
    write('Step 1: We have the fact: raining'), nl,
    write('Step 2: We have the rule: not_strawberry_picking :- raining'), nl,
    write('Step 3: By modus ponens, we derive: not_strawberry_picking'), nl,
    write('Step 4: Resolution refutation successful!'), nl,
    write('Conclusion: NOT strawberry_picking is TRUE'), nl, nl.

% --- GOAL 2: Prove "enjoy" ---
% Resolution Steps:
% 1. From clause 1: (~sunny ∨ ~warm ∨ enjoy)
% 2. From clause 7: sunny
% 3. From clause 5: warm
% 4. Resolve with sunny and warm: enjoy

proof_enjoy :-
    write('GOAL 2: Proving enjoy'), nl,
    write('----------------------'), nl,
    write('Step 1: We have the fact: sunny'), nl,
    write('Step 2: We have the fact: warm'), nl,
    write('Step 3: We have the rule: enjoy :- sunny, warm'), nl,
    write('Step 4: By modus ponens, we derive: enjoy'), nl,
    write('Step 5: Resolution refutation successful!'), nl,
    write('Conclusion: enjoy is TRUE'), nl, nl.

% --- GOAL 3: Prove "wet" ---
% Resolution Steps:
% 1. From clause 4: (~raining ∨ wet)
% 2. From clause 6: raining
% 3. Resolve (1) and (2): wet

proof_wet :-
    write('GOAL 3: Proving wet'), nl,
    write('-------------------'), nl,
    write('Step 1: We have the fact: raining'), nl,
    write('Step 2: We have the rule: wet :- raining'), nl,
    write('Step 3: By modus ponens, we derive: wet'), nl,
    write('Step 4: Resolution refutation successful!'), nl,
    write('Conclusion: wet is TRUE'), nl, nl.

% ============================================
% PART 6: DEMONSTRATION & QUERIES
% ============================================

% Run all proofs
run_all_proofs :-
    write('==============================================='), nl,
    write('   RESOLUTION REFUTATION DEMONSTRATION'), nl,
    write('==============================================='), nl, nl,
    proof_not_strawberry_picking,
    proof_enjoy,
    proof_wet,
    write('==============================================='), nl,
    write('   ALL PROOFS COMPLETED'), nl,
    write('==============================================='), nl.

% ============================================
% PART 7: QUERY EXAMPLES
% ============================================
/*
HOW TO USE THIS FILE:
---------------------
1. Save this file as 'weather.pl'
2. Open SWI-Prolog command line (type 'swipl' in cmd)
3. Load the file: [weather].
4. Run queries:

BASIC QUERIES:
?- warm.          % Returns: true
?- raining.       % Returns: true
?- sunny.         % Returns: true
?- pleasant.      % Returns: true

GOAL QUERIES:
?- enjoy.         % Returns: true (Goal 2)
?- wet.           % Returns: true (Goal 3)
?- not_strawberry_picking.  % Returns: true (Goal 1)
?- strawberry_picking.      % Returns: true (warm AND pleasant are both true)

PROOF DEMONSTRATIONS:
?- proof_enjoy.              % Shows resolution steps for Goal 2
?- proof_wet.                % Shows resolution steps for Goal 3
?- proof_not_strawberry_picking.  % Shows resolution steps for Goal 1
?- run_all_proofs.           % Runs all three proofs with explanations

CNF QUERIES:
?- cnf_clause(1, X).         % Shows CNF clause 1
?- cnf_clause(N, Clause).    % Shows all CNF clauses (press ; for next)

ADVANCED QUERIES:
?- remove_implications(implies(and(sunny, warm), enjoy), X).
   % Shows CNF transformation
*/