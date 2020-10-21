(define (gcd a b)
    (if (= b 0) a (gcd b (remainder a b))))

;(gcd 15 10)

; normal order - (gcd 206 40)
; assuming if is a special form and do not reduce
; 1 subst outermost gcd substituted:
;     (if (= 40 0) a (gcd 40 (remainder 206 40))))
; 2 subst outermost if calculated:
;     (if (= 40 0) a (gcd 40 (remainder 206 40))))
; reduced to
; (gcd 40 (remainder 206 40))
; 3
; (if (= (remainder 206 40) 0) 40 (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))))
; and so on...