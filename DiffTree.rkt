#lang eopl

;Punto 2: Diff-tree

;Implementación de la Interfaz Diff-tree

; Diff-tree ::= (one)
;           ::= (diff (Diff-tree) (Diff-tree))

;Definición del cero
(define zero '(diff (one) (one)) )

;Predicado is-zero?
(define is-zero? (lambda (d)
                   (and (equal? (car d) 'diff )
                        (and (equal? (cadr d) '(one) )
                             (equal? (caddr d) '(one) )  )
                        )  ))
;predicado successor (bottom up)

(define successor (lambda (dft) (cond
                                  []
                                  [])




                    ))