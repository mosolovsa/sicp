; (define (expmod base exp m)
;     (cond ((= exp 0) 1)
;           ((even? exp) (remainder (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m))
;           (else (remainder (* base (expmod base (- exp 1) m)) m))))
;
; vs
;
; (define (expmod base exp m)
;     (cond ((= exp 0) 1)
;           ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
;           (else (remainder (* base (expmod base (- exp 1) m)) m))))
;
; The key difference in the number of arguments. In case of:
; ... (square (expmod base (/ exp 2) m)) ...
; (expmod base (/ exp 2) m) is calculated once, because there is only one argument
; and inside the square function multiplication is performed on a already evaluated
; argument as of the scheme interpreter has applicative (eager) evaluation mode.
; ... (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) ...
; '*' function has 2 args, they are the same but I bet interpreter are not so smart
; enough to prove that and calculates each argument one after another.