(define tolerance 0.00001)

(define (fixed-point f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (f guess)))
            (display "Trying: ")
            (display guess)
            (display " f(guess): ")
            (display next)
            (newline)
            (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(define (fixed-point-avg-dumping f first-guess)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))
    (define (try guess)
        (let ((next (/ (+ guess (f guess)) 2)))
            (display "Trying: ")
            (display guess)
            (display " f(guess): ")
            (display next)
            (newline)
            (if (close-enough? guess next)
            next
            (try next))))
    (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
; Trying: 2 f(guess): 9.965784284662087
; Trying: 9.965784284662087 f(guess): 3.004472209841214
; Trying: 3.004472209841214 f(guess): 6.279195757507157
; Trying: 6.279195757507157 f(guess): 3.759850702401539
; Trying: 3.759850702401539 f(guess): 5.215843784925895
; Trying: 5.215843784925895 f(guess): 4.182207192401397
; Trying: 4.182207192401397 f(guess): 4.8277650983445906
; Trying: 4.8277650983445906 f(guess): 4.387593384662677
; Trying: 4.387593384662677 f(guess): 4.671250085763899
; Trying: 4.671250085763899 f(guess): 4.481403616895052
; Trying: 4.481403616895052 f(guess): 4.6053657460929
; Trying: 4.6053657460929 f(guess): 4.5230849678718865
; Trying: 4.5230849678718865 f(guess): 4.577114682047341
; Trying: 4.577114682047341 f(guess): 4.541382480151454
; Trying: 4.541382480151454 f(guess): 4.564903245230833
; Trying: 4.564903245230833 f(guess): 4.549372679303342
; Trying: 4.549372679303342 f(guess): 4.559606491913287
; Trying: 4.559606491913287 f(guess): 4.552853875788271
; Trying: 4.552853875788271 f(guess): 4.557305529748263
; Trying: 4.557305529748263 f(guess): 4.554369064436181
; Trying: 4.554369064436181 f(guess): 4.556305311532999
; Trying: 4.556305311532999 f(guess): 4.555028263573554
; Trying: 4.555028263573554 f(guess): 4.555870396702851
; Trying: 4.555870396702851 f(guess): 4.555315001192079
; Trying: 4.555315001192079 f(guess): 4.5556812635433275
; Trying: 4.5556812635433275 f(guess): 4.555439715736846
; Trying: 4.555439715736846 f(guess): 4.555599009998291
; Trying: 4.555599009998291 f(guess): 4.555493957531389
; Trying: 4.555493957531389 f(guess): 4.555563237292884
; Trying: 4.555563237292884 f(guess): 4.555517548417651
; Trying: 4.555517548417651 f(guess): 4.555547679306398
; Trying: 4.555547679306398 f(guess): 4.555527808516254
; Trying: 4.555527808516254 f(guess): 4.555540912917957
; Trying: 4.555540912917957 f(guess): 4.555532270803653

(fixed-point-avg-dumping (lambda (x) (/ (log 1000) (log x))) 2)
; Trying: 2 f(guess): 5.9828921423310435
; Trying: 5.9828921423310435 f(guess): 4.922168721308343
; Trying: 4.922168721308343 f(guess): 4.628224318195455
; Trying: 4.628224318195455 f(guess): 4.568346513136242
; Trying: 4.568346513136242 f(guess): 4.5577305909237005
; Trying: 4.5577305909237005 f(guess): 4.555909809045131
; Trying: 4.555909809045131 f(guess): 4.555599411610624
; Trying: 4.555599411610624 f(guess): 4.5555465521473675
; Trying: 4.5555465521473675 f(guess): 4.555537551999825

; 34 vs 9