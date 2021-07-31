#lang sicp

(define (unique-pairs n)
  (define (gen-pairs n)
    (define (impl j acc)
      (if (< j 1) acc (impl (- j 1) (cons (list j n) acc))))
    (impl (- n 1) '()))

  (define (impl acc i)
    (if (< i 2) acc
        (impl (append acc (gen-pairs i)) (- i 1))))

  (impl '() n))

(unique-pairs 5)

(define (make-sum-pair pair) 
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))) 

(define (filter p s) 
  (cond ((null? s) nil) 
        ((p (car s)) 
         (cons (car s)  
               (filter p (cdr s)))) 
        (else (filter p (cdr s)))))

 (define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2)) 
  
 (define (prime-sum? pair) 
   (prime? (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n) 
  (map make-sum-pair 
       (filter prime-sum? (unique-pairs n))))

(prime-sum-pairs 6)