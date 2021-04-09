(define nil '())

(define (fold-left op acc seq)
    (if (null? seq) acc (fold-left op (op (car seq) acc) (cdr seq))))

(define (fold-right op acc seq) 
    (if (null? seq) 
        acc 
        (op (car seq) (fold-right op acc (cdr seq)))))

(fold-right / 1 (list 1 2 3)) ; 3/1 -> 2/3 -> 1/(2/3) = 3/2

(fold-left / 1 (list 1 2 3)) ; 1/1 -> 2/1 -> 3/2 = 3/2

(fold-right list nil (list 1 2 3)) ; (3 nil) -> (2 (3 nil)) -> (1 (2 (3 nil)))

(fold-left list nil (list 1 2 3)) ; (1 nil) -> (2 (1 nil)) -> (3 (2 (1 nil)))