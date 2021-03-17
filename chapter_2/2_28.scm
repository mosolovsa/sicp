(define x (list (list 1 2) (list 3 4)))

; I'm appologize for my procedural mindset. I'm a little bit tired.
(define (fringe l)
    (define acc '())
    (define (add-leaf x) (set! acc (append acc (list x))))
    (define (iter-leaves l acc)
        ; (newline)
        (if (pair? l)
           (begin
                ; (display "Got pair: ")
                ; (display l)
                (let ((cur (car l)))
                    (if (pair? cur)
                        (iter-leaves cur acc)
                        (begin
                            ; (display " Got leaf: ")
                            ; (display cur)
                            (add-leaf cur)
                        )
                    )
                )
                (iter-leaves (cdr l) acc)                
           )
           (cond ((not (null? l)) (add-leaf l)))
           ; (begin
                ; (display "Recursion base: ")
                ; (display l)
           ; )
        )
    )
    (iter-leaves l '())
    acc
)

(fringe x)

(fringe (list x x))

(fringe 3)