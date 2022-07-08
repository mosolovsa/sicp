#lang sicp
(#%require sicp-pict)

(define (split main-operation sub-operation) 
  (define (generic-split painter n) 
    (if (= n 0) 
        painter 
        (let ((smaller (generic-split painter (- n 1)))) 
          (main-operation painter (sub-operation smaller smaller))))) 
  generic-split)

(define up-split (split below beside))

(define right-split (split beside below))

(paint (up-split einstein 1))

(paint (right-split einstein 1))