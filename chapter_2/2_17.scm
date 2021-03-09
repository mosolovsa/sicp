(define (last-pair l)
    (if (pair? (cdr l))
        (last-pair (cdr l))
        (list (car l))))

(last-pair (list 23 72 149 34))
