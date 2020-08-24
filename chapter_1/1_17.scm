(define (double x)
    (* 2 x))

(define (halve x)
    (/ x 2))

(define (mult a b)
    (cond ((= b 1) a)
          ((= (remainder b 2) 0) (mult (double a) (halve b)))
          (else (+ a (mult a (- b 1))))))

(mult 5 3)