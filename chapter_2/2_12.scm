(define make-interval cons)

(define lower-bound car)

(define upper-bound cdr)

(define (make-center-percent c p)
    (let ((abs_dev (abs (* 0.01 c p))))
     (cons (- c abs_dev) (+ c abs_dev))))

(make-center-percent 2 50)