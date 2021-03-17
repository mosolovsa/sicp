(define (my-len l)
    (define (my-iter-len l i)
        (if (null? l) i (my-iter-len (cdr l) (+ i 1))))
    (my-iter-len l 0))

(define (my-get-at l i)
    (if (= i 1) (car l) (my-get-at (cdr l) (- i 1))))

(define (my-deep-reverse l) 
    (define len (my-len l))
    (define (myr i rv)
        (if (> i len) rv
           (let ((cur (my-get-at l i)))
               (myr (+ i 1) (cons (if (pair? cur) (my-deep-reverse cur) cur) 
                                rv)))))
    (myr 1 '()))

(define x (list (list 1 2) (list 3 4)))

; ((4 3) (2 1))
(my-deep-reverse x)