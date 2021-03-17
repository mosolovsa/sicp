; (define (make-mobile left right) 
;   (list left right)) 
; (define (left-branch mobile) 
;   (car mobile)) 
; (define (right-branch mobile) 
;   (car (cdr mobile))) 
  
; (define (make-branch length structure) 
;   (list length structure)) 
  
; (define (branch-length branch) 
;   (car branch)) 
; (define (branch-structure branch) 
;   (car (cdr branch)))

 (define (make-mobile left right) 
   (cons left right)) 
  
 (define (left-branch mobile) 
   (car mobile)) 
 (define (right-branch mobile) 
   ;; Have to use cdr at this point  
   (cdr mobile))  
  
 (define (make-branch length structure) 
   (cons length structure)) 
  
 (define (branch-length branch) 
   (car branch)) 
 (define (branch-structure branch) 
   (cdr branch)) 

(define (total-weight m)
    (cond ((null? m) 0)
          ((pair? m) (+ (total-weight (branch-structure (left-branch m)))
                       (total-weight (branch-structure (right-branch m)))))
          (else m)))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))

(total-weight a)

(define b (make-mobile (make-branch 10 a) (make-branch 12 5)))

(total-weight b)

(define (torque branch) 
   (* (branch-length branch) (total-weight (branch-structure branch))))

(define (balanced? mobile) 
   (if (not (pair? mobile)) 
       true 
       (and (= (torque (left-branch mobile)) (torque (right-branch mobile))) 
            (balanced? (branch-structure (left-branch mobile))) 
            (balanced? (branch-structure (right-branch mobile))))))

(balanced? a)

(balanced? b)

(define c (make-mobile (make-branch 3 3) (make-branch 2 3)))

(define d (make-mobile (make-branch 10 c) (make-branch 12 5)))

(balanced? d)

(balanced? c)