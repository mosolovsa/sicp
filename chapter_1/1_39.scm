(define (cont-frac n d k)
    (define (recur i)
        (if (= i k)
            (/ (n k) (d k))
            (/ (n i) (+ (d i) (recur (+ i 1))))))
    (recur 1))

(define (tanh x k)
    (cont-frac
        (lambda (i) (if (= i 1) x (- 0 (* x x))))
        (lambda (i) (- (* 2 i) 1.0))
        k))

(tanh 3 100)