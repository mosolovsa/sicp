(define (smallest-divisor x)
    (define (test-divisor-or-next n)
        (cond ((> (* n n) x) x)
              ((= (remainder x n) 0) n)
              (else (test-divisor-or-next (+ n 1)))
        )
    )
    (test-divisor-or-next 2))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
    )
)

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time)
)

(define (search-for-primes start count)
    (define (impl-sfp test iter)
        (if (prime? test) 
            (begin 
                (display test)
                (newline)
                (if (< iter count)
                    (impl-sfp (+ test 2) (+ iter 1))
                    (display "finish"))
            )
            (impl-sfp (+ test 2) iter)
        )
    )
    (impl-sfp (if (= (remainder start 2) 0) (+ start 1) start) 1)
)

(let ((start-time (runtime)))
    (begin
        (search-for-primes 1000000000000000 3)
        (display "Elapsed: ")
        (display (- (runtime) start-time))        
    )
)

; n                 time            sqrt(n)
;1000               0               31.6227766
;1000000            0               44.72135955
;1000000000         0.1             54.77225575
;1000000000000      3.08            63.2455532
;1000000000000000   121.14          70.71067812