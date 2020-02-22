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
;permite visualizar un árbol en formato de listas (unparse)
(define view-tree
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) '())
      (node (key left right) (list key (view-tree left) (view-tree right) ) )
      ) 

    )
  )

;permite convertir un arbol en formato de listas a tipo de dato(?
(define parse (lambda (bt) (cond [(equal? bt '()) (empty-tree '()) ]
                                 [else (node (car bt) (parse (car (cdr bt))) (parse (car (cdr (cdr bt))) ) )]

                             )))


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
(define number->bintree
    (lambda (n)
       (node n (empty-tree empty-bintree) (empty-tree empty-bintree)
      ))
    )

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
(define bintree-with-at-least-one-child?
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) #f)
      (node (key left right) (cond [(and (empty-bintree? left) (empty-bintree? right)) #f]
                                   [(or (bintree? left) (bintree? right)  ) #t]
                                   ) )
      )
    )
  )

;insert-to-left (insert-to-left )
(define insert-to-left
  (lambda (n bt)
    (cases bintree bt
      (empty-tree (lv) (node n empty-bintree empty-bintree ) )
      (node (key left right)
            (cond [(empty-bintree? left ) (view-tree (node key (number->bintree n) right ))  ]
                  [else (node key (insert-to-left left) right) ]
                  
                  )
            )
      )
    )
  )
    
;insert-to-right (insert-to-right )
(define insert-to-right
  (lambda (n bt)
    (cases bintree bt
      (empty-tree (lv) (node n empty-bintree empty-bintree ) )
      (node (key left right)
            (cond [(empty-bintree? right ) (view-tree (node key  left (number->bintree n) ))  ]
                  [else (node key left (insert-to-right right)) ]
                  
                  )
            )
      )
    )
  )


;bintree-order-validation
(define bintree-order-validation
  (lambda (bt)
    (cases bintree bt
      (empty-tree (lv) #t)
      (node (key left right) (cond
                               [(and (cases bintree left
                                       (empty-tree (lv) #t)
                                       (node (key1 left1 right1) #f)) (cases bintree right
                                                                     (empty-tree (lv) #t)
                                                                     (node (key1 left1 right1) #f))   ) #t ]
                               [(and (< (cases bintree left
                                          (empty-tree (lv) -10000)
                                          (node (key1 left1 right1) key1 )
                                          )  key) (> (cases bintree right
                                                       (empty-tree (lv) 10000)
                                                       (node (key1 left1 right1) key1 )
                                                       ) key)) (and (bintree-order-validation left ) (bintree-order-validation right ) )]
                               [else #f]
                              
                             
)

            


            
                               )   


      )

    ))

;insert-element-into-bintree ;lamasputaaa
(define insert-element-into-bintree
  (lambda (n bt)
    (cases bintree bt
      (empty-tree (lv)  (number->bintree n))
      (node (key left right) (cond
                               
                               [(< n key) (node key (insert-element-into-bintree n left ) right) ]
                               [(> n key) (node key left (insert-element-into-bintree n right)) ] )
            ))))
;

(define tree1 (node 3
                    (node 2 (empty-tree '() ) (empty-tree '() ))
                    (node 4 (empty-tree '() ) (empty-tree '() ) ) ) )

(define emptree (empty-tree empty-bintree ))

(define leaftree (node 1 (empty-tree '() ) (empty-tree '() ) ))

(define wftree (node 6 (node 5 (node 4 (empty-tree '() ) (empty-tree '() ) ) (empty-tree '() ) ) (node 8 (empty-tree '() ) (empty-tree '() )) ))

(define bftree (node 6 (node 9 (empty-tree '() ) (empty-tree '() ) ) (node 8 (empty-tree '() ) (empty-tree '() )) ))

(define simptree (node 1 (empty-tree '() ) (empty-tree '() )))

(define Arbol_Ejemplo (node 8 (node 3 (node 1 (empty-tree '() ) (empty-tree '() )) (node 6 (node 4 (empty-tree '() ) (empty-tree '() )) (node 7 (empty-tree '() ) (empty-tree '() )))) (node 10 (empty-tree '() ) (node 14 (node 13 (empty-tree '() ) (empty-tree '() )) (empty-tree '() )))))
;(8 (3 (1 () ()) (6 (4 () ()) (7 () ()))) (10 () (14 (13 () ()) ())))



;pregunta para Juamarcos: ¿La inserción tiene algún tipo de orden o restricción?