(define make-interval cons)

(define lower-bound car)

(define upper-bound cdr)

(define (pos? x) (< 0 x))

(define (neg? x) (> 0 x))

(define (add-interval x y)
        (make-interval (+ (lower-bound x) (lower-bound y))
                       (+ (upper-bound x) (upper-bound y))))

(define (div-interval x y)
    (mul-interval x 
                  (make-interval (/ 1.0 (upper-bound y)) 
                                 (/ 1.0 (lower-bound y)))))

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

(define (par1 r1 r2)
    (div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))

(define (par2 r1 r2)
    (let ((one (make-interval 1 1)))
     (div-interval one
                   (add-interval (div-interval one r1)
                                 (div-interval one r2)))))

(define i1 (make-interval -1 3))

(define i2 (make-interval 5 6))

(par1 i1 i2)

(par2 i1 i2)

; differs :(