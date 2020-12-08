(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (repeated f n)
    (define (inner i acc)
        (if (= i n)
            acc
            (inner (+ i 1) (lambda (x) (f (acc x))))))
    (inner 1 (lambda (x) (f x))))

((repeated inc 2) 1)

((repeated square 2) 5)