#lang eopl

;Datatypes

(define-datatype bintree bintree?
  (empty-tree (nv null?) )
  (node (key number?)
        (left bintree?)
        (right bintree?)))

;Empty-bintree
(define empty-bintree '())

;;AUXXXXXXXXXX FUNCCCCCCCCCCCTSSSSSSSSSSS
;permite visualizar un árbol en formato de listas
(define view-tree
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) '())
      (node (key left right) (list key (view-tree left) (view-tree right) ) )
      ) 

    )
  )


;current-element
(define current-element (lambda (bt)
                          (cases bintree bt
                            (empty-tree (lv) '())
                            (node (key left right) key )

                            )
                          
                          ))

;move-to-left-son

(define move-to-left-son (lambda (bt)
                           (cases bintree bt
                             (empty-tree (lv) '())
                             (node (key left right) (view-tree left))
                             
                           )
                          
                          ))

;move-to-right-son
(define move-to-right-son (lambda (bt)
                           (cases bintree bt
                             (empty-tree (lv) '())
                             (node (key left right) (view-tree left))
                             
                           )    
                          
                          ))

;number->bintree
#;(define number->bintree (lambda (n) ))

;empty-bintree?
(define empty-bintree?
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) #t)
      (node (key left right) #f))))


;at-leaf?
(define at-leaf?
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) #f  )
      (node (key left right) (cond [(and (empty-bintree? left) (empty-bintree? right)) #t ]
                                   [else #f])   )
      )
    )

)


;bintree-with-at-least-one-child?

;insert-to-left

;bintree-order-validation

;insert-element-into-bintree

;

(define tree1 (node 3
                    (node 2 (empty-tree '() ) (empty-tree '() ))
                    (node 4 (empty-tree '() ) (empty-tree '() ) ) ) )

(define emptree (empty-tree empty-bintree ))