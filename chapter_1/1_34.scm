(define (f g) (g 2))

(define (square a) (* a a))

(f square)

(f (lambda (z) (* z (+ z 1))))

; (f f)
; (define (f g) (g 2))
; (f f) -> (f 2)) -> (2 2)
; The object 2 is not applicable.
; same as
; (2)
; The object 2 is not applicable.