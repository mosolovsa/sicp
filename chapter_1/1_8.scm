(define (display-all . args)
   (display args)) 

(define (abs x)
    (if (< x 0) (- x) x))

(define (good-enough? prev guess)
    (< (abs (- prev guess)) (* guess 0.000001)))

(define (improve guess x)
    (/ (+ (/ x (* guess guess)) (* 2 guess)) 3)
)

(define (sqrt-iter prev guess x)
    (display-all "sqrt-iter" prev guess "\n")
    (if (good-enough? prev guess) guess (sqrt-iter guess (improve guess x) x))
)

(sqrt-iter 0.0 1.0 8.0)
