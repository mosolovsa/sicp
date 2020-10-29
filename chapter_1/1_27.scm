(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
          (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))

(define (full-test-prime? n)
    (define (details-impl stop iter)
        (cond ((>= iter stop) true)
          ((fermat-test n) (details-impl stop (+ iter 1)))
          (else false)))
    (details-impl n 2))

; 561, 1105, 1729, 2465, 2821 and 6601
(full-test-prime? 561)      ; #t
(full-test-prime? 1105)     ; #t
(full-test-prime? 1729)     ; #t
(full-test-prime? 2465)     ; #t
(full-test-prime? 2821)     ; #t
(full-test-prime? 6601)     ; #t

(* 187 3)                   ; 561 :(