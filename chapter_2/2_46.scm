#lang sicp

(define (make-vect x y) (cons x y))

(define xcor-vect car)

(define ycor-vect cdr)

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect x v)
  (make-vect (* x (xcor-vect v))
             (* x (ycor-vect v))))

(let ((v1 (make-vect 1 2))
      (v2 (make-vect 3 4)))
  (display v1)
  (newline)
  (display (xcor-vect v1))
  (newline)
  (display (ycor-vect v1))
  (newline)
  (display (add-vect v1 v2))
  (newline)
  (display (sub-vect v1 v2))
  (newline)
  (display (scale-vect 2 v1)))
  