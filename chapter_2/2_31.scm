(define (tree-map tree op)
    (map (lambda (sub-tree)
            (if (pair? sub-tree)
               (tree-map sub-tree op)
               (op sub-tree)))
        tree))

(define a (list 1
            (list 2 (list 3 4) 5)
            (list 6 7)))

(tree-map a (lambda (x) (* x x)))