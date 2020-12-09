(define dx 0.001)

(define (repeated f n)
    (define (inner i acc)
        (if (= i n)
            acc
            (inner (+ i 1) (lambda (x) (f (acc x))))))
    (inner 1 (lambda (x) (f x))))

(define (avg3 x y z) (/ (+ x y z) 3))

(define (smooth f)
    (lambda (x) (avg3 (f (- x dx)) (f x) (f (+ x dx)))))

(define (repeated-smooth f n) (repeated smooth n))