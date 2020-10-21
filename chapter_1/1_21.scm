(define (smallest-divisor x)
    (define (test-divisor-or-next n)
        (cond ((> (* n n) x) x)
              ((= (remainder x n) 0) n)
              (else (test-divisor-or-next (+ n 1)))
        )
    )
    (test-divisor-or-next 2))


(smallest-divisor 2)

(smallest-divisor 3)

(smallest-divisor 4)

(smallest-divisor 5)

(smallest-divisor 6)

(smallest-divisor 7)

(smallest-divisor 199)

(smallest-divisor 1990)

(smallest-divisor 1999)

(smallest-divisor 19999)
