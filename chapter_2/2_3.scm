(define (make-point x y) (cons x y))

(define x-point car)

(define y-point cdr)

(define (make-segment a b) (cons a b))

(define start-segment car)

(define end-segment cdr)


;(define (make-rect p w h) (cons p (cons w h)))
(define (make-rect a c) (cons a c))

;(define (rect-w r) (car (cdr r)))
(define (rect-w r) (abs (- (x-point (car r)) (x-point (cdr r)))))

;(define (rect-h r) (cdr (cdr r)))
(define (rect-h r) (abs (- (y-point (car r)) (y-point (cdr r)))))


(define (rect-p r) (* 2 (+ (rect-w r) (rect-h r))))

(define (rect-area r) (* (rect-w r) (rect-h r)))

;(define test-rect (make-rect (make-point 0 0) 1 2))
(define test-rect (make-rect (make-point 0 0) (make-point 1 2)))

(rect-p test-rect)

(rect-area test-rect)
