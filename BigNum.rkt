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
(define suma (lambda (n) () ) )

;RESTA
(define resta (lambda (n) () ) )

;MULTIPLICACION
(define multiplicacion (lambda (n) () ) )

;DIVISION
(define division (lambda (n) () ) )

;POTENCIA
(define potencia (lambda (n) () ) )

;FACTORIAL
(define factorial (lambda (n) () ) )
