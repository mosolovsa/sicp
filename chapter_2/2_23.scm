(define (my-for-each f l)
    (if (null? l)
        ()
        (begin 
            (f (car l))
            (my-for-each f (cdr l)))))

(my-for-each (lambda (x) (newline) (display x)) (list 57 321 88))