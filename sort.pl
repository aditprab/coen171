quicksort([], []).
/*Note about Prolog array notation: [X | Y] is a way to handle lists without knowing what's actually in them.
  X is just the left most element of the list, Y is the rest of the list.   
*/
quicksort([First | Last], Result) :-
	/*Define the array as "First" and the rest  "Last", which is the rest of the array, or what we'd call the "tail" in functional.*/
	/*append into Result*/
	partition(First, Last, LeftArray, RightArray), /*Apply partition and get the left array and right array with first as the pivot.*/
       	/*Apply quicksort on left to get SortedLeftArray, do same on right to get SortedRightArray*/
	quicksort(LeftArray,SortedLeftArray), quicksort(RightArray, SortedRightArray),
	/*First is the element in the middle of the array after quicksortes have fully been called. Append appropriately.*/
        append(SortedLeftArray,[First|SortedRightArray], Result).

partition(PivotElement, [], [], []).
/*"Rest" is the rest of the array. The equivalent of cdr in scheme or lisp*/
/*Two definitions for partition to emulate the "if" statement comparison we would normally do*/
partition(PivotElement, [First | Rest], [First | LeftArray], RightArray) :-
	 First @=< PivotElement, /*no idea why you need this @ symbol in prolog, but it won't work without it.*/
         partition(PivotElement, Rest, LeftArray, RightArray).

partition(PivotElement, [First | Rest], LeftArray, [First | RightArray]) :-
	 First @> PivotElement,
         partition(PivotElement, Rest, LeftArray, RightArray).


