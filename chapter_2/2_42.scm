#lang sicp

(define (enumerate-interval min-inc max-exc)
  (if (<= min-inc max-exc)
      (cons min-inc (enumerate-interval (+ min-inc 1) max-exc))
      nil))

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence)))))

(define (filter p s) 
  (cond ((null? s) nil) 
        ((p (car s)) 
         (cons (car s)  
               (filter p (cdr s)))) 
        (else (filter p (cdr s)))))

(define (flatmap proc seq) 
  (accumulate append nil (map proc seq)))

(define empty-board '()) 

(define (adjoin-position row col rest) 
  (cons (list row col) rest)) 

(define (safe? k positions) 
  (let ((trial (car positions)) 
        (trial-row (caar positions)) 
        (trial-col (cadar positions)) 
        (rest (cdr positions))) 
    (accumulate (lambda (pos result) 
                  (let ((row (car pos)) 
                        (col (cadr pos))) 
                    (and (not (= (- trial-row trial-col) 
                                 (- row col))) 
                         (not (= (+ trial-row trial-col) 
                                 (+ row col))) 
                         (not (= trial-row row)) 
                         result))) 
                #t 
                rest)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (let ((retval (filter
                       (lambda (positions) (safe? k positions))
                       (flatmap
                        (lambda (rest-of-queens)
                          (map (lambda (new-row)
                                 (adjoin-position
                                  new-row k rest-of-queens))
                               (enumerate-interval 1 board-size)))
                        (queen-cols (- k 1))))))
          ;(display retval) (newline) retval)))
                        retval)))
  (queen-cols board-size))

(queens 7)