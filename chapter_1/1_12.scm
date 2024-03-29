(define (pt r c)
    (cond ((or (< c 1) (>= c r)) 1)
          (else (+ (pt (- r 1) (- c 1)) (pt (- r 1) c)))))

(pt 0 0)
(pt 1 0)
(pt 1 1)
(pt 2 0)
(pt 2 1)
(pt 2 2)
(pt 3 0)
(pt 3 1)
(pt 3 2)
(pt 3 3)
(pt 4 0)
(pt 4 1)
(pt 4 2)
(pt 4 3)
(pt 4 4)