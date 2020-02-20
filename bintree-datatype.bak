#lang eopl

;Datatypes

(define-datatype bintree bintree?
  (empty-tree (nv null?) )
  (node (key number?)
        (left bintree?)
        (right bintree?)))

;Empty-bintree


(define empty-bintree (lambda (bt)
                        (cases bintree bintree?
                          (empty-tree (nv) #true)
                          (node (key left right) #false))))