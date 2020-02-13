#lang eopl
;Taller 2
;Punto 1
;Empezamos con la interfaz

(define zero '())

(define is-zero? (lambda (n) (null? n)))

(define successor (lambda (n) (cond
                                [(is-zero? n) (cons 1 n)]
                                [(< (car n) 31) (cons (+ 1 (car n)) (cdr n)) ]
                                [(= (car n) 31) (cons 0 (successor (cdr n)))]
)))




(define predecessor (lambda (n) (cond
                                  [(is-zero? n) '()]
                                  [(> (car n) 0) (cons (- (car n) 1) (cdr n))]
                                  [(= (car n) 0) (cons 31 (predecessor (cdr n))) ]

                                  ) ))

;Pasamos a la implementación mela
;Debemos hacer:
;SUMA
(define suma (lambda (op1 op2) (let sumaux ([carrier 0] [op1] [op2])
                                 (cond
                                   [(and (null? op1) (null? op2)) '()]
                                   [(= carrier 0) (cond
                                                    [(> (+ (car op1) (car op2))    31) (cons 0 (sumaux (- (+ ) 31) (cdr op1) (cdr op2))) ]
                                                    [(< (+ (car op1) (car op2))    32) (cons (+ (car op1) (car op2)) (suma (cdr op1) (cdr op2)))   ]))))
                                                    ]))))


                                

;Pruebas
;'(0 1 2) '(1 1 1) 


                                    ;garbage
                                    ;(> (+ (car op1) (car op2))    31) (cons 0 (suma (cdr op1) (cdr op2))) ]
                                   ;[(< (+ (car op1) (car op2))    32) (cons (+ (car op1) (car op2)) (suma (cdr op1) (cdr op2)))   ]))))