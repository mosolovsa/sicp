; (define (expmod base exp m)
;     (cond ((= exp 0) 1)
;           ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
;           (else (remainder (* base (expmod base (- exp 1) m)) m))))
;
; vs
;
; (define (expmod base exp m)
; (remainder (fast-expt base exp) m))

; Difference is in the intermidiate result's order of growth. Second case will lead to much bigger numbers during computation.
; I've assumed that this can be the reason of overflow or precision error, but after quick googling I've read that Scheme
; interpreter supports full precision calculations and, as a tradeoff, suffers from perfomance degradation during calculations with
; relatively big numbers.