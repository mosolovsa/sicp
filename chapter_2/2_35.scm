(define (accumulate p acc seq)
    (if (null? seq) acc
        (accumulate p (p acc (car seq)) (cdr seq))))

(define (set-leaves-to-one x) (if (pair? x) (map set-leaves-to-one x) 1))

(define (count-leaves t)
    (accumulate 
            (lambda (acc val) (if (pair? val) 
                                (+ (count-leaves val) acc) (+ val acc)))
                                0 
            (map set-leaves-to-one t)))

(define t (list 1 (list 1 2 3) (list 1 2 3)))

(count-leaves t)