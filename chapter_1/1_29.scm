(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))

(define (sum-upto stop)
    (define (next a) (+ a 1))
    (define (identity a) a)
    (sum identity 0 next stop))

(sum-upto 3)

(define (integral f a b dx)
    (define (next a) (+ a dx))
    (define (term a) (f a))
    (* dx (sum term (+ a (/ dx 2)) next b)))

(define (cube a)
    (* a a a))

(integral cube 0 1 0.01)

(integral cube 0 1 0.001)

(define (simpson f a b dx)
    (define (next a) (+ a (* 2 dx)))
    (define (term-x2 a) (* 2 (f a)))
    (define (term-x4 a) (* 4 (f a)))
    (* (/ dx 3)
       (+ (f a)
       (sum term-x4 (+ a dx) next b)  
       (sum term-x2 (+ a (* 2 dx)) next b)  
       (f b))))

(simpson cube 0 1 0.01)

(simpson cube 0 1 0.001)