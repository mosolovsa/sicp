; rfold
(define (accumulate op acc seq) 
    (if (null? seq) 
        acc 
        (op (car seq) (accumulate op acc (cdr seq))))) 

; TODO validate that k is at least a pair
(define (horner x k)
    (+ (accumulate (lambda (val acc) (* (+ acc val) x)) 0 (cdr k)) (car k)))

(horner 2 (list 1 3 0 5 0 1))