(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? n (- times 1)))
          (else false)))

(define (smallest-divisor x)
    (define (get-next-divisor n)
        (if (= n 2) 3 (+ n 2)) )

    (define (test-divisor-or-next n)
        (cond ((> (* n n) x) x)
              ((= (remainder x n) 0) n)
              (else (test-divisor-or-next (get-next-divisor n)))
        )
    )
    (test-divisor-or-next 2))

(define (prime? n)
    (fast-prime? n 100))

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
        (search-for-primes 1000 3)
        (display "Elapsed: ")
        (display (- (runtime) start-time))        
    )
)

; n                 time                            sqrt(n)             log(n)
;1000               0.                              31.6227766          6.907755278982137
;1000000            .02                             44.72135955         7.600902459542082
;1000000000         .01                             54.77225575         8.006367567650246
;1000000000000      1.9999999999999997e-2           63.2455532          8.294049640102028
;1000000000000000   .04                             70.71067812         8.517193191416238