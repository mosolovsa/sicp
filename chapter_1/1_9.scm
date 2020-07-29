; (define (+ a b)
;     (if (= a 0)
;         b
;         (inc (+ (dec a) b))))

; (define (+ a b)
;     (if (= a 0)
;         b
;         (+ (dec a) (inc b))))

; recursive process
; 1st
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (inc (+ 0 5)))))
; (inc (inc (inc (inc (5)))))
; (inc (inc (inc (6))))
; (inc (inc (7)))
; (inc 8)
; 9

; iterative process by tail recursion call elimination
; in case of recursion we can just return value after calculating recurrent function
; because it's last thing we must calculate
; 2nd
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9