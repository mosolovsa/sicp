(define (get-s n)
    (if (= (remainder n 2) 1)
        0
        (+ 1 (get-s (/ n 2)))))

(define (get-d n s)
    (/ n (expt 2 s)))

(define (full-test-prime? number)
    (define s (get-s (- number 1)))
    (define d (get-d (- number 1) s))
    (define (miler-rabin a s d n)
        (define (test-r r)
            (define y (expt a (* (expt 2 r) d)))
            (if (= (remainder y n) (- n 1))
                #t
                (if (< r s) (test-r (+ r 1)) #f)))
        (if (= (remainder (expt a d) n) 1)
            #t
            (test-r 0)))

    (define (test-all-a i)
        (if (< i number)
            (if (miler-rabin i s d number)
                (test-all-a (+ i 1))
                #f)
            #t))

    (test-all-a 2))

(define (prime? n)
        (cond ((= n 1) #t)
              ((= n 2) #f)
              (else (full-test-prime? n))))

(define (accumulate filter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (if (filter a)
                (iter (next a) (combiner result (term a)))
                (iter (next a) result))))
    (iter a null-value))

(define (sum-prime-squares a b) 
    (accumulate prime? (lambda (a b) (+ a b)) 0 (lambda (a) (* a a)) a (lambda (n) (+ n 1)) b))

(sum-prime-squares 1 7)

(define (prod-rel-prime stop)
    (define (gcd a b) (if (= b 0) a (gcd b (remainder a b))))
    (define (rel-prime? a) (= (gcd a stop) 1))
    (accumulate rel-prime? (lambda (a b) (* a b)) 1 (lambda (a) a) 1 (lambda (n) (+ n 1)) stop))

(prod-rel-prime 7)