(define (f n)
    (cond  ((< n 3) n)
           (else (+ (f (- n 1)) (f (- n 2)) (f (- n 3)))))
)

(define (fi n)
    (define (fi_h f1 f2 f3 step stop)
        (if (= step stop) f3 (fi_h f2 f3 (+ f1 f2 f3) (+ step 1) stop)))

    (cond ((< n 3) n)
          (else (fi_h 1 2 3 3 n))))
