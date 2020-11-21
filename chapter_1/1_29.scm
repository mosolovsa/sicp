(define (series start init-accum op next term)
    (define (details iter accum)
        (if (term iter)
            accum
            (details (next iter) (op iter accum))))
    (details start init-accum))   

(define (sum start stop)
    (define (term iter) (> iter stop))
    (define (sum-accum iter accum) (+ accum iter))
    (define (seq iter) (+ iter 1))
    (series start 0 sum-accum seq term))

(define (integral f start stop delta)
    (define (integral-sum iter accum) (+ accum (f iter)))
    (define (next iter) (+ iter delta))
    (define (term iter) (> iter stop))
    (* delta (series (+ start delta) 0 integral-sum next term)))

(define (simpson-rule f start stop delta)
    (define (synth-stop) (round (/ (- stop start) delta)))
    (define (mult step) (if (remainder step 2) 4 2))
    (define (x step) (+ start (* delta step)))
    (define (integral-sum iter accum) (+ accum (* (mult iter) (f (x iter)))))
    (define (next iter) (+ iter 1))
    (define (term iter) (>= iter (synth-stop)))
    (* (/ (/ (- stop start) (synth-stop)) 3)
       (+ (f start) (series 1 0 integral-sum next term) (f stop))))

(define (cube x) (* x x x))

(sum 1 3)

(integral cube 0 1 0.001)

(simpson-rule cube 0 1 0.001)