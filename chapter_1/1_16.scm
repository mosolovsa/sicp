(define (pow b n)
    (define (fast-expt i acc)
        (display "fast-expt\n")
        (cond
            ((= n i) acc)
            ((<= (* 2 i) n) (fast-expt (* 2 i) (* acc acc)))
            (else (fast-expt (+ i 1) (* acc b)))
        )
    )

    (if (= n 0) 1 (fast-expt 1 b))
)

(pow 2 4)
