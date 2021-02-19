(define zero (lambda (f) (lambda (x) x)))

; return function of 2 args
; first is produce-next
; second is null value
(define (add-1 n)
    (lambda (f) (lambda (x) (f ((n f) x)))))

;(define one 
    ; zero -> (lambda (y) (lambda (z) z))
    ; (lambda (f) (lambda (x) (f (((lambda (y) (lambda (z) z)) f) x)))))
    ;   > ((lambda (y) (lambda (z) z)) f) -> (lambda (z) z)
    ; ^^^^^^^
    ; (lambda (f) (lambda (x) (f ((lambda (z) z) x)))))
    ;   > ((lambda (z) z) x) -> x
    ; ^^^^^^^
    ; (lambda (f) (lambda (x) (f x)))) <--   args: (f x) returns (f x) or f(x) in all-humans notation
    ;))))
;)

;(define two
    ; (lambda (f) (lambda (x) (f (((f x) f) x)))))
    ; same logic
    ; (f (f x))
;)

; Map to natural numbers set
; one
(((add-1 zero) (lambda (x) (+ x 1))) 0)

; two
(((add-1 (add-1 zero)) (lambda (x) (+ x 1))) 0)
