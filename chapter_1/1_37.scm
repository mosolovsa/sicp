(define (cont-frac n d k)
    (define (recur i)
        (if (= i k)
            (/ (n k) (d k))
            (/ (n i) (+ (d i) (recur (+ i 1))))))
    (recur 1))

(define (cont-frac-iter n d k)
    (define (impl acc i)
        (if (= i 1) 
            (/ (n 1) (+ (d 1) acc))
            (impl (/ (n i) (+ (d i) acc)) (- i 1))))
    (impl (/ (n k) (d k)) (- k 1)))

(cont-frac (lambda (i) 1) (lambda (i) 1) 100)
(cont-frac-iter (lambda (i) 1) (lambda (i) 1) 100)

(define (golden-ratio k)
    (cont-frac (lambda (i) 1) (lambda (i) 1) k))

(define (find-n n)
    (newline)
    (display n)
    (newline)
    (display (abs (- (golden-ratio n) 0.618)))
    (let ((approx (golden-ratio n)))
        (if (and (< (abs (- approx 0.618)) 0.0001) (> approx 0.618))
            n
            (find-n (+ n 1)))))

(find-n 1)

(exact->inexact (golden-ratio 10))
(exact->inexact (golden-ratio 11))