#lang eopl
;Arboles ejemplo:
(define tree1 '(10 '(2 (1 '() '()) '() )  '() )  )


;Bintree: representacion listas

;empty-bintree
(define empty-bintree '())

;current-element
(define current-element (lambda (bt) (car bt )))

;move-to-left-son

(define move-to-left-son (lambda (bt) (car (cdr bt))))

;move-to-right-son
(define move-to-right-son (lambda (bt) (car (cdr (cdr bt)))) )

;number->bintree
(define number->bintree (lambda (n) (list n empty-bintree empty-bintree )))

;empty-bintree?:
(define empty-bintree? (lambda (bt) (null? bt) ))

;at-leaf?
(define at-leaf? (lambda (bt) (cond [(and (empty-bintree? (cadr bt)) (empty-bintree?  (caddr bt))) #t ]
                                    [else #f]
) )   )



(at-leaf? '(1 '() '()) )







 


