(define nil '())

(define (fold-left op acc seq)
    (if (null? seq) acc (fold-left op (op (car seq) acc) (cdr seq))))

(define (fold-right op acc seq) 
    (if (null? seq) 
        acc 
        (op (car seq) (fold-right op acc (cdr seq)))))

(define (reverser sequence)
    (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reversel sequence)
    (fold-left (lambda (x y) (cons x y)) nil sequence))

(reverser (list 1 2 3))

(reversel (list 1 2 3))