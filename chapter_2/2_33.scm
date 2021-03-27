; lfold - complicates my-append
; (define (accumulate p acc seq)
;     (if (null? seq) acc
;         (accumulate p (p acc (car seq)) (cdr seq))))

; rfold
(define (accumulate op acc seq) 
    (if (null? seq) 
        acc 
        (op (car seq) (accumulate op acc (cdr seq))))) 

(accumulate + 0 (list 1 2 3))

(define (my-map p seq)
    (accumulate (lambda (x y) (cons (p x) y)) '() seq))
    ;(append x (list (p y)))) '() seq))

(my-map (lambda (x) (+ 1 x)) (list 1 2 3))

(define (my-append seq1 seq2)    
    (accumulate cons seq2 seq1))

(my-append (list 1 2 3) (list 4 5 6))

(define (length sequence)
    (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(length (list 1 2 3))