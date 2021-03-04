(define make-interval cons)

(define lower-bound car)

(define upper-bound cdr)

(define (sub-interval x y)
    (make-interval (- (lower-bound x) (upper-bound y))
                  (- (upper-bound x) (lower-bound y))))

(define i1 (make-interval 1 3))

(define i2 (make-interval 0 5))

(sub-interval i1 i2)
