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

(define t (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(accumulate-n + 0 t) ; = (22 26 30)