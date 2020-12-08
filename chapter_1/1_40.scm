(define (newthon f x0)
    (define (enough? x) (< (f x) 0.00001))
    (define (Df x) (/ (- (f (+ x 0.001)) (f x)) 0.001))
    (define (iter x) (- x (/ (f x) (Df x))))
    (define (find x)
        (newline)
        (display x)
        (newline)
        (display (f x))
        (newline)
        (display (Df x))
        (if (enough? x)
            x
            (find (iter x))))
    (find x0)
)

(newthon (lambda (x) (- (* x x) 2)) 3)
;3
;7
;6.000999999999479
;1.8335277453756695
;1.3618239930623859
;3.668055490751332
;1.4622618262814515
;.13820964859996598
;2.9255236525624895
;1.4150191220637272
;2.279115806001375e-3
;2.8310382441270043
;1.4142140761372974
;1.453144869767442e-6
;2.8294281522742715
;Value: 1.4142140761372974

(define (cube a b c)
    (lambda (x) (+ (* x x x) (* b x x) (* a x) c)))

(newthon (cube 0 0 -27) 4)