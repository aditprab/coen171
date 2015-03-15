/*To run: compile, then findSolutions(Board) (or any capitalized variable name in place of Board*/

/*define a board, col/row */
chessboard([1/Row1,2/Row2,3/Row3,4/Row4,5/Row5,6/Row6,7/Row7,8/Row8]). 

findSolutions(BoardLayout) :-
	/*wrapper for easy call*/
	chessboard(BoardLayout),isSolution(BoardLayout).

danger(Colnumber,[]).
danger(Column/Row,[OtherColumn/OtherRow|Enemies]) :-
	/*Enemies defined as "other pieces" on the board */
	Row =\= OtherRow, /*evaluates to true when column is not equal to column1*/
 	/*Mathematically ensure they aren't in the same row, column, diagonal.*/
	OtherRow - Row =\= Column - OtherColumn, 
	OtherRow - Row =\= OtherColumn - Column,
	/*Recursion: if the above two evaluated to true, we keep checking with the other spots.*/
	danger(Column/Row,Enemies).

isSolution([]). 
isSolution([Column/Row|Enemies]) :-
	isSolution(Enemies),
	/*Use built in member function to make sure the row is within 1 and 8, and no out of bounds errors are encountered.*/
	member(Row, [1,2,3,4,5,6,7,8]),
	/*Check if the piece we're about to try is in danger if placed on board.*/ 
	danger(Column/Row, Enemies).


