;(define (fixed-point f guess)
;    (define (good-enough? guess)
;        (if (< (abs (- (f guess) guess)) 0.00001) #t #f))
;    (define (try-guess guess)
;        (if (good-enough? guess)
;            guess
;            (try-guess (f guess))))
;    (try-guess guess))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (newline)
            (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(cos 1.0)

(fixed-point cos 1.0)

(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)

(+ (sin 1.2587228743052672) (cos 1.2587228743052672))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)

(+ 1 (/ 1 1.6180371352785146))