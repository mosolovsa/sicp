; N i равны 1, а D i последовательно равны 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, . . .

(define (cont-frac n d k)
    (define (recur i)
        (if (= i k)
            (/ (n k) (d k))
            (/ (n i) (+ (d i) (recur (+ i 1))))))
    (recur 1))

(define (find-e k)
    (define (D i)
        (if (= (remainder i 3) 2)
            (* 2 (/ (+ i 1) 3))
            1))
    (+ 2 (cont-frac (lambda (i) 1.0) D k)))

(find-e 10)
