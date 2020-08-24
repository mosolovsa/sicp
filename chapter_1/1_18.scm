(define (double x)
    (* 2 x))

(define (halve x)
    (/ x 2))

(define (mult a b)
    (define (fast-mult i acc)
        (cond
            ((= b i) acc)
            ((<= (double i) b) (fast-mult (double i) (double acc)))
            (else (fast-mult (+ i 1) (+ acc a)))
        )
    )

    (if (or (= a 0) (= b 0)) 0 (fast-mult 1 a))
)

(mult 5 3)