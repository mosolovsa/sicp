; a = 2^s*d, a % 2 = 1

(define (get-s n)
    (if (= (remainder n 2) 1)
        0
        (+ 1 (get-s (/ n 2)))
))

(define (get-d n s)
    (/ n (expt 2 s))
)

; #t - composite, #f - prime
(define (miler-rabin n)
    (define s (get-s n))
    (define d (get-d n s))
    (define (test a)
        (define (test-s iters)
            (define y (remainder (expt a (expt 2 iters)) n))
            (if (< iters s)
                (cond ((= y 1) #t)
                      ((= y (- n 1)) (test-s (+ iters 1)))
                      (else #t)
                )
                #f)
        )
        (define x (remainder (expt a d) n))
        (if (or (= x 1) (= x (- n 1)))
            #f
            (test-s 0)
        )
    )
    (define (iter a)
        (if (< a n)
            (if (test a)
                #t
                (iter (+ a 1)))
            #f)
    )
    (iter 1)
)

(miler-rabin 3)

; 561, 1105, 1729, 2465, 2821 and 6601
(miler-rabin 3)
(miler-rabin 4)
(miler-rabin 561)
(miler-rabin 1105)
(miler-rabin 1729)
(miler-rabin 2465)
(miler-rabin 2821)
(miler-rabin 6601)

;1 ]=> (miler-rabin 3)
;Value: #f

;1 ]=> ; 561, 1105, 1729, 2465, 2821 and 6601
;(miler-rabin 3)
;Value: #f

;1 ]=> (miler-rabin 4)
;Value: #t

;1 ]=> (miler-rabin 561)
;Value: #f

;1 ]=> (miler-rabin 1105)
;Value: #f

;1 ]=> (miler-rabin 1729)
;Value: #f

;1 ]=> (miler-rabin 2465)
;Value: #f

;1 ]=> (miler-rabin 2821)
;Value: #f

;1 ]=> (miler-rabin 6601)
;Value: #f

;1 ]=> 
;End of input stream reached.
;Moriturus te saluto.