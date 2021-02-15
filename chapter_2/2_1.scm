; (define make-rat cons)

(define (gcd a b)
  (cond ((= b 0) a)
        (else (gcd b (modulo a b)))))

(define (make-rat n d)
    (let ((g (gcd n d)))
        (cons (/ n g) (/ d g))))

(define numer car)

(define denom cdr)

(define (print-rat x)
    (newline)
    (if (= (denom x) 1)
        (display (numer x))            
        (begin
            (display (numer x))
            (display "/")
            (display (denom x)))
        ))

(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y)) (* (numer y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))

(define (equal-rat? x y)
    (= (* (numer x) (denom y))
       (* (numer y) (denom x))))

(define one-third (make-rat 1 3))

(define two-third (make-rat 2 3))

(print-rat one-third)

(print-rat two-third)

(print-rat (add-rat one-third two-third))

(gcd 3 9)

(print-rat (make-rat (- 2) 3))

(print-rat (make-rat (- 2) (- 3)))

(print-rat (make-rat 2 (- 3)))

(print-rat (make-rat 1 -2))

(print-rat (make-rat 6 -9))