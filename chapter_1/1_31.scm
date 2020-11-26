(define (prod-linear-rec term a next b)
    (if (> a b)
        1
        (* (term a)
           (prod-linear-rec term (next a) next b))))

(define (prod-iter term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

(define (prod term a next b) (prod-linear-rec term a next b))

(define (factorial stop)
    (define (next a) (+ a 1))
    (define (identity a) a)
    (prod identity 1 next stop))

(factorial 4)

(define (square a) (* a a))

(define (give-me-pi stop)
    (define (square a) (* a a))
    (define (next a) (+ a 1))
    (define (term a) (/ (square (* 2 a)) (* (- (* 2 a) 1) (+ (* 2 a) 1))))
    (* 2 (prod term 1 next stop)))

(give-me-pi 10)         ; 3.067703806643499
(give-me-pi 50)         ; 3.1260789002154112
(give-me-pi 100)        ; 3.1337874906281624
