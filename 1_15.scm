(define (cube x) (* x x x))

(define (p x)
    (set! count (+ count 1))
    (- (* 3 x) (* 4 (cube x)))
)

(define count 0)

(define (sine angle)    
    (if (<= (abs angle) 0.1)
        angle
        (p (sine (/ angle 3.0)))
    )
)

(sine 12.15)
(display count)