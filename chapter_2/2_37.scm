(define nil '())

(define (accumulate op acc seq) 
    (if (null? seq) 
        acc 
        (op (car seq) (accumulate op acc (cdr seq)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
              (let ((sec (car (cdr seqs))))
                  (accumulate-n op init (if (null? sec) nil (map cdr seqs)))))))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
    (map (lambda (row) (dot-product v row)) m))

(define mat (list (list 1 2 3) (list 2 1 2) (list 3 2 3)))

(define vec (list 1 1 1))

(matrix-*-vector mat vec)

(define (transpose mat)
    (accumulate-n (lambda (v acc) (append acc (list v))) nil mat))

(transpose mat)

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (rows) (reverse (matrix-*-vector cols rows))) m)))

(matrix-*-matrix mat (list (list 1 0 0) (list 0 1 0) (list 0 0 1)))