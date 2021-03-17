 (define (make-mobile left right) 
   (list left right)) 
 (define (left-branch mobile) 
   (car mobile)) 
 (define (right-branch mobile) 
   (car (cdr mobile))) 
  
 (define (make-branch length structure) 
   (list length structure)) 
  
 (define (branch-length branch) 
   (car branch)) 
 (define (branch-structure branch) 
   (car (cdr branch)))

(trace +)

(define (total-weight m)
    ; I like to debug missing parenthesis
    ; (newline)
    ; (display m)
    ; (display " - ")
    ; (display (null? m))
    ; (display " - ")
    ; (display (pair? m))
    (cond ((null? m) 0)
          ((pair? m) (+ (total-weight (branch-structure (left-branch m)))
                       (total-weight (branch-structure (right-branch m)))))
          (else m)))
          ;m))))

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))

(total-weight a)
