(define make-interval cons)

(define lower-bound car)

(define upper-bound cdr)

(define (pos? x) (< 0 x))

(define (neg? x) (> 0 x))
  
(define (mul-interval x y)
    (let ((x1 (lower-bound x)) 
          (x2 (upper-bound x)) 
          (y1 (lower-bound y)) 
          (y2 (upper-bound y)))
     (cond ((and (pos? x1) (pos? y1))
                (make-interval (* x1 y1) (* x2 y2))) 
           ((and (pos? x2) (pos? y1)) 
                (make-interval (* x1 y2) (* x2 y2))) 
           ((and (pos? x1) (pos? y2)) 
                (make-interval (* x2 y1) (* x2 y2))) 
           ((and (neg? x2) (pos? y2)) 
                (make-interval (* x1 y2) (* x2 y1))) 
           ((and (pos? x2) (neg? y2)) 
                (make-interval (* x1 y2) (* x2 y1))) 
           ((and (neg? x2) (neg? y2)) 
                (make-interval (* x1 y1) (* x2 y2))) 
           ((and (pos? x2) (pos? y2)) 
                (let ((i1 (* x1 y1)) 
                      (i2 (* x1 y2)) 
                      (i3 (* x2 y1)) 
                      (i4 (* x2 y2))) 
                      (make-interval (min i1 i2 i3 i4) 
                                     (max i1 i2 i3 i4)))))))

(define i1 (make-interval -1 3))

(define i2 (make-interval 5 6))

(mul-interval i1 i2)                                     