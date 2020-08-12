; (define cnt 0)

(define (count-change amount)
    (cc amount 5 0))

(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
          ((= kinds-of-coins 2) 5)
          ((= kinds-of-coins 3) 10)
          ((= kinds-of-coins 4) 25)
          ((= kinds-of-coins 5) 50)))

(define (cc amount kinds-of-coins level)
    (display (string (make-string (* 4 level) #\space) "cc " (number->string amount) " : " (number->string kinds-of-coins) "\n"))
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount
                       (- kinds-of-coins 1) (+ level 1))
                   (cc (- amount
                            (first-denomination kinds-of-coins))
                            kinds-of-coins (+ level 1))))))

(count-change 11)
