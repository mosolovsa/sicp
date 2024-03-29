(define (A x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (A (- x 1) (A x (- y 1))))
    )
)

(A 1 10)
; 1024

(A 2 4)
; 65536

(A 3 3)
; 65536

; (define (f n) (A 0 n)) equivalent to
;     (cond ((= n 0) 0)
;           else (* 2 n))
;     )
; )
; n == 0 : 0
; n > 0 : 2n;

; (define (g n) (A 1 n))
; n == 0 : 0
; n == 1 : 2
; n > 1 : recursive Akkerman(0, Akkerman(1, n-1)) -> 2*Akkerman(1, n-1)

; (define (h n) (A 2 n))
; n == 0 : 0
; n == 1 : 2
; n > 1 : recursive Akkerman(1, Akkerman(2, n-1))