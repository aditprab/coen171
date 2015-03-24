;;To run, I used the bigloo compiler on the DC machines. The command was: bigloo qsort.scm -o quicksort. I then did ./quicksort to run. 
(module qsort)
;;Quick sort implementation in Scheme.
;;Algorithm, using functional paradigms, is basically: 
;;let pivot be the first element.
;;append values less than pivot while calling quicksort on those values as a list, append values equal to pivot (no need to call quicksort, and then append values greater than pivot while calling quicksort on those values.

(define (quicksort inputList)
      
      (if (null? inputList)'()
	;;Set pivot- first element of the list (easiest to get to using car). 
      	;;using let* because quicksort is recursive and pivot will be redefined. 
	(let*((pivot (car inputList))
     			(listWithoutHead (cdr inputList))
			(rightList (partition (lambda (x) (> x pivot)) listWithoutHead))
     			(leftList (partition (lambda (x) (< x pivot)) listWithoutHead))
	)
	;;append the result of a quicksort operation on the "left" returned by the partition with the result of the "right" returned. 
	(append (quicksort leftList) (cons pivot (quicksort rightList))))
	)
)

(define (partition lambdafunction inputList)
      (if (null? inputList)'() ;;Partition will be called with an empty list at the end of the quicksort algorithm.
      (let ((firstElement (car inputList))(listWithoutFirst(cdr inputList))) 
        (if (lambdafunction (car inputList))
            (cons firstElement (partition lambdafunction listWithoutFirst))
            (partition lambdafunction listWithoutFirst)
	)
      )
   )
)

(display "Performing quick sort on the list 9 3 1 0 7")
(display #\newline)
(display (quicksort(list 9 3 1 0 7)))
(display #\newline)
(display "Performing quicksort on the list 700 200 500 100 99 22 1 16")
(display #\newline)
(display (quicksort(list 700 200 500 100 99 22 1 16)))
(display #\newline)
(display "Performing quicksort on the list 60 5000 12 100 2 0 14 1000")
(display #\newline)
(display (quicksort(list 60 5000 12 100 2 0 14 1000)))
(display #\newline)
