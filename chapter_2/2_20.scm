(define (filter pred l)    
)

(define (same-parity h . t)
    (define pred (if (even? h) even? odd?))
    (cons h (filter pred t)))


(same-parity 1 2 3 4 5 6 7)
; (1 3 5 7)

(same-parity 2 3 4 5 6 7)
; (2 4 6)
