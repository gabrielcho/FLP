#lang eopl
;;

;; down: list -> list
;; down =: <list>
;; Retorna una lista con cada elemento asociado a un nivel mayor de paréntesis

(define down
  (lambda (L)
    (if (null? L)
        L
        (cons (list (car L)) (down (cdr L)) ))))

;;

;; list-index: predicate, list -> listelement
;; list-index =: (list-index <predicate> <list>)
;; Recibe un predicado de validez junto con una lista y retorna el índice del primer elemento de la lista
;; que cumpla con el predicado

(define list-index   (lambda (P L)
                        (let lol ([i 0] [pred P] [lst L])
                          (if (null? lst)
                              #f
                              (if (pred (car lst))
                                  i
                                  (lol (+ 1 i) pred (cdr lst))
                                  )
                              ))))

;

;; mapping:  function, list, list -> list
;; <mapping> =: (mapping <func> <list> <list>)
;; <func> =:
;; mapping recibe una función y dos listas y retorna una lista de pares

(define mapping 
  (lambda (F L1 L2)
    (if (and (null? L1) (null? L2))
        '()
        (if (equal? (length L1) (length L2) ) ; Si el tamaño de las listas es igual 
            (if (equal? (F (car L1)) (car L2))
                (cons (list (car L1) (car L2 )) (mapping F (cdr L1) (cdr L2) ))
                (mapping F (cdr L1) (cdr L2))  
        
                )
            #f
            )
        
        )

    ))
;;;;, NOT NECESSARY(let lol ([func F] [lst1 L1] [lst2 L2] [aux '()])

;
; zip: function, list, list -> list
; <zip> =: (zip <func> <list> <list>)
(define zip
  (lambda (F L1 L2)
   (if (and (null? L1) (null? L2))
       '()
    (if (equal? (length L1) (length L2) )
        (cons (F (car L1) (car L2) ) (zip F (cdr L1) (cdr L2) ))
        '()
        ))
    )
  )



;

;path: number, bst -> list

(define path
  (lambda (n BST)
    (if (null? BST)
        #f
        (if (equal? n (car BST))
            '()
            (if (< n (car BST))
                (cons 'left (path n (car (cdr BST))))
                (cons 'right (path n (car (cdr (cdr BST)) ) ) )
                
             )
            )
        )
    )

  )


; prod-scalar-matriz: matrix, vector -> list
;
;      LA EXPRESIÓN MAESTRA (LA QUE HACE POSIBLE TODA LA MAGIA)
;     (cons (list (* (car vec) (car (car mat))) (* (car(cdr vec)) (car (car (cdr mat ))) )  ) (prod-scalar-matrix (cdr mat) vec)  )

; test (prod-scalar-matrix '((1 1) (2 2)) '(2 3))
(define prod-scalar-matrix
  (lambda (mat vec)
    (if (or (null? mat) (null? vec))
        '()
        (if (or (null? (cdr mat)) (null? (cdr vec)))
            (list (list (* (car vec) (car (car mat))) (* (car (cdr vec)) (car (cdr  (car mat))))))
            (cons (list (* (car vec) (car (car mat))) (* (car(cdr vec)) (car (cdr (car mat) ))    )  ) (prod-scalar-matrix (cdr mat) vec)  )
         )
     )
    )
)
