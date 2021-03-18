(define (square-tree1 tree)
    (cond ((null? tree) '())
           ((not (pair? tree)) (* tree tree))
           (else (cons (square-tree1 (car tree))
                      (square-tree1 (cdr tree))))))

(define (square-tree2 tree)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
               (square-tree2 sub-tree)
               (* sub-tree sub-tree)))
        tree))

(define a (list 1
            (list 2 (list 3 4) 5)
            (list 6 7)))

(square-tree1 a)

(square-tree1 a)