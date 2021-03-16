(define (my-filter pred l)
    (cond ((null? l) '())
          ((pred (car l)) (cons (car l) (my-filter pred (cdr l))))
          (else (my-filter pred (cdr l)))))

(define (same-parity h . t)
    (define pred (if (even? h) even? odd?))
    (cons h (my-filter pred t)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
