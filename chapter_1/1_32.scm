(define (accumulate-linear-rec combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
           (accumulate-linear-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))

(define (accumulate combiner null-value term a next b)
    (accumulate-linear-rec combiner null-value term a next b))

(define (prod term a next b) 
    (define (perform a b) (* a b))
    (accumulate perform 1 term a next b))

(define (sum term a next b) 
    (define (perform a b) (+ a b))
    (accumulate perform 0 term a next b))

(define (sum-upto stop)
    (define (next a) (+ a 1))
    (define (identity a) a)
    (sum identity 0 next stop))

(sum-upto 4)

(define (factorial stop)
    (define (next a) (+ a 1))
    (define (identity a) a)
    (prod identity 1 next stop))

(factorial 4)