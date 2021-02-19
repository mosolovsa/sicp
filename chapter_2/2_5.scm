(define (cons-ab a b)
    (* (expt 2 a) (expt 3 b)))

(define (rat-div n d)
    (define (inner cnt n)
        (if (= (remainder n d) 0)
            (inner (+ cnt 1) (/ n d))
            cnt))
    (inner 0 n))

(define (car-ab n)
    (rat-div n 2))

(define (cdr-ab n)
    (rat-div n 3))

(define n (cons-ab 2 3))

(cdr-ab n)

(car-ab n)