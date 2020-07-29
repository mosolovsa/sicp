(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; if b is positive (if (> b 0) + -) reduces to + so total expression reduces to (+ a b)
; if b is negative (if (> b 0) + -) reduces to + so total expression reduces to (- a b)
; the behaviour is similar as if we sum a and abs b.