(define (make-point x y) (cons x y))

(define x-point car)

(define y-point cdr)

(define (make-segment a b) (cons a b))

(define start-segment car)

(define end-segment cdr)

(define (midpoint-segment l)
    (define (mid sel a b)
        (/ (+ (sel a) (sel b)) 2))
    (let ((a (start-segment l))
          (b (end-segment l)))
    (make-point 
        (mid x-point a b)
        (mid y-point a b))))

(define ab (make-segment (make-point 0 0) (make-point 2 5)))

(midpoint-segment ab)
