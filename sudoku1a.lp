% Define numbers between 1 and 4
num(1..4).

% Ensure each cell contains exactly one number between 1 and 4
1 { sudoku(X, Y, N) : num(N) } 1 :- num(X), num(Y).

% Row constraint: No number appears more than once in any row
:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2, num(X), num(N).

% Column constraint: No number appears more than once in any column
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2, num(Y), num(N).

% Ensure the initial values are respected if provided in the instance
sudoku(X, Y, N) :- initial(X, Y, N).

% Only output the solved cells, do not output other atoms like num or initial
#show sudoku/3.
