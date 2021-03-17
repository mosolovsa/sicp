(define (square-list1 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons (square (car things))
                      answer))))
    (iter items '()))

(square-list1 `(1 2 3))

(define (square-list2 items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr things)
                (cons answer
                     (square (car things))))))
    (iter items '()))

(square-list2 `(1 2 3))

; cons is pair consructor (cons car cdr) so when you pass list to car you've got the list as a first element of a pair

(define (square-list3 items) 
    (define (iter l rev) 
        (define r (square (car l))) 
        (if (null? (cdr l)) 
            (rev (list r))   ; TODO: can we make it without list?
            (iter (cdr l) (lambda (x) (rev (cons r x)))))) 
    (iter items (lambda (x) x)))

; call) (lambda (x) (pick (cons r x)))
; 1) (lambda (x) ((lambda (x) x) (cons r x))) -> (lambda (x) (cons r x))
; 2) (lambda (x) ((lambda (x) (cons r x)) (cons r x)))

;
; (lambda (ARG) (rev (cons SQUARED ARG)))
; 1 [(lambda (X) X)] -> (lambda (ARG) ((lambda (X) X) (cons SQUARED ARG))) -> (lambda (ARG) (cons SQUARED1 ARG))
; 2 [(lambda (ARG) (cons SQUARED1 ARG))] -> (lambda (ARG) (rev (cons SQUARED2 ARG))) -> (lambda (ARG) ((cons SQUARED1 (cons SQUARED2 ARG)))
; ...

(square-list3 `(1 2 3))