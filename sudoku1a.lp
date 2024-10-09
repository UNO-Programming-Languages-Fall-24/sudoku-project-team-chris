num(1..4).

{ sudoku(X, Y, N) : num(N) } = 1 :- num(X), num(Y).

:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2, num(X), num(N).

:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2, num(Y), num(N).

:- sudoku(X1, Y1, N), sudoku(X2, Y2, N),
   1 + ((X1-1) / 2) * 2 + (Y1-1) / 2 = 1 + ((X2-1) / 2) * 2 + (Y2-1) / 2,
   (X1, Y1) != (X2, Y2), num(N).

sudoku(X, Y, N) :- initial(X, Y, N).

% Show only the sudoku/3 atoms in the output
#show sudoku/3.
