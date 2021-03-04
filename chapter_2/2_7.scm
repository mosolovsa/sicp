(define make-interval cons)

(define lower-bound car)

(define upper-bound cdr)


(define interval (make-interval 1 5))

(+ (upper-bound interval) (lower-bound interval))