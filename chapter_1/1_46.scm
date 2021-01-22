(define (abs x) (if (< x 0) (- x) x))

(define (iter-improve good-enough? improve!)
    (define (ret-proc x)
        (if (good-enough? x)
            x
            (ret-proc (improve! x)))
    )
    ret-proc
)

(define (sqrt val)
    (define (details-good? x) (< (abs (- val (* x x))) 0.001))
    (define (details-imp! x) (/ (+ (/ val x) x) 2))
    ((iter-improve details-good? details-imp!) 2))

(exact->inexact (sqrt 81))

(define (fixed f start)
    (define (details-good? x) (< (abs (- (f x) (f (f x)))) 0.001))
    (define (details-imp! x) (f x))
    ((iter-improve details-good? details-imp!) start))

(fixed cos 1.0)