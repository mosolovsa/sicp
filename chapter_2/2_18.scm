(define (my-len l)
    (define (my-iter-len l i)
        (if (null? l) i (my-iter-len (cdr l) (+ i 1))))
    (my-iter-len l 0))

(define (my-get-at l i)
    (if (= i 1) (car l) (my-get-at (cdr l) (- i 1))))

(define (my-reverse l) 
    (define len (my-len l))
    (define (myr i rv)
        (if (> i len) rv
            (myr (+ i 1) (cons (my-get-at l i) rv))))
    (myr 1 '()))

(my-reverse (list 1 4 9 16 25))
