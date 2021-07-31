#lang sicp

(define (enumerate-interval min-inc max-exc)
  (if (< min-inc max-exc)
      (cons min-inc (enumerate-interval (+ min-inc 1) max-exc))
      nil))

(define (remove x s)
  (let ((h (car s)))
    (if (= x h) (cdr s) (cons h (remove x (cdr s))))))

(define (accumulate op initial sequence) 
  (if (null? sequence) 
      initial 
      (op (car sequence) 
          (accumulate op initial (cdr sequence))))) 

(define (flatmap proc seq) 
  (accumulate append nil (map proc seq))) 

(define (extend s a)
  (flatmap (lambda (x) (map (lambda (e) (append (if (pair? x) x (list x)) (list e))) a)) s))

(define (gen3 n) (extend (extend (enumerate-interval 0 n) (enumerate-interval 0 n)) (enumerate-interval 0 n)))

(define (filter p s) 
  (cond ((null? s) nil) 
        ((p (car s)) 
         (cons (car s)  
               (filter p (cdr s)))) 
        (else (filter p (cdr s)))))

(define (sum l)
  (accumulate + 0 l))

(define (find-triplets-sum n x)
  (filter (lambda (s) (= (sum s) x)) (gen3 n)))

(find-triplets-sum 3 2)