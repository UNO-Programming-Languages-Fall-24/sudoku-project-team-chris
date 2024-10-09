% Define numbers between 1 and 9
num(1..9).

% Ensure each cell contains exactly one number between 1 and 9
1 { sudoku(X, Y, N) : num(N) } 1 :- num(X), num(Y).

% Row constraint: No number appears more than once in any row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2, num(X), num(N).

% Column constraint: No number appears more than once in any column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2, num(Y), num(N).

% Subgrid constraint: No number appears more than once in any subgrid
:- sudoku(X1, Y1, N), sudoku(X2, Y2, N), subgrid(X1, Y1, G), subgrid(X2, Y2, G), (X1, Y1) != (X2, Y2), num(N), subgrid(X1, Y1, G).

% Ensure the initial values are respected if provided in the instance
sudoku(X, Y, N) :- initial(X, Y, N).

% Subgrid definitions for a 9x9 board:
subgrid(X, Y, G) :-
    num(X), num(Y),
    G = ((X - 1) / 3) * 3 + ((Y - 1) / 3) + 1.

% Only output the solved cells
#show sudoku/3.
