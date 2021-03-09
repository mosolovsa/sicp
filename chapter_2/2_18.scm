(define (last-elem l)
    (if (pair? (cdr l))
        (last-elem (cdr l))
        (car l)))

(define (drop-last l)
    (if (and (pair? l) (pair? (cdr l)))
        (cons (car l) (drop-last (cdr l)))
        '()))

(define (my-reverse l)
    (if (pair? l)
        (cons (last-elem l) (my-reverse (drop-last l)))
        '()))

(my-reverse (list 1 4 9 16 25))
