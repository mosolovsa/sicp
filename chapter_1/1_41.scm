(define (inc x) (+ x 1))

(define (double f) (lambda (x) (f (f x))))

((double inc) 5)
(((double (double double)) inc) 5)
; (double double)
; g(g(x)) where g(x) is f(f(x)) -> f(f(f(f(x))))
; (double (double double))
; g(g(g(g(x)))) where g(x) is f(f(f(f(x)))) -> 16 times f(x)
; 21