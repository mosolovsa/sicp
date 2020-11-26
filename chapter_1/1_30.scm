(define (sum-linear-rec term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum-linear-rec term (next a) next b))))

(define (sum-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ result (term a)))))
    (iter a 0))

(define (sum term a next b) (sum-iter term a next b))

(define (sum-upto stop)
    (define (next a) (+ a 1))
    (define (identity a) a)
    (sum identity 0 next stop))

(sum-upto 4)