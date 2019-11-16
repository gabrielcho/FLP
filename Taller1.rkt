#lang eopl

;; down: list -> list
;; <down> =: (down <list>)
;; Retorna una lista con cada elemento asociado a un nivel mayor de paréntesis

(define down
  (lambda (L)
    (if (null? L)
        L
        (cons (list (car L)) (down (cdr L)) ))))

;pruebas
(down '(jajjj sisas yeah (nonas) ))
(down '(por favor acaben con este sufrimiento))

;;

;; list-index: predicate, list -> listelement
;; list-index ::= (list-index <predicate> <list>)
;; Recibe un predicado de validez junto con una lista y retorna el índice del primer elemento de la lista
;; que cumpla con el predicado

(define list-index   (lambda (P L)
                        (let indexaux ([i 0] [pred P] [lst L])
                          (if (null? lst)
                              #f
                              (if (pred (car lst))
                                  i
                                  (indexaux (+ 1 i) pred (cdr lst))
                                  )
                              ))))

;prueba
(list-index number? '(esto no es 1 numero) )
(list-index null? '( (realmente merece) (la pena) () (seguir?)))
;

;; mapping:  function, list, list -> list
;; <mapping> ::= (mapping <func> <list> <list>)
;; <func> ::= procedure
;; recibe una función y dos listas y retorna una lista de pares que cumplan con la condición F(a)=b

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
;pruebas
(mapping (lambda (d) (- d 10) ) '(10 20 30 40) '(0 10 20 30))
(mapping (lambda (d) (cons 'me d)) '(jodo quiero duermo muero) '( (me . jodo) (me . quiero)  (me . duermo) (me . muero)))

; zip: function, list, list -> list
; <zip> ::= (zip <func> <list> <list>)
; aplica el procedimiento binario F para cada par de elementos n de las listas L1 y L2
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

;pruebas
(zip * '(1 2 3) '(1 2 3))
(zip - '(3 4 5) '(3 4 5))



;path: number, bst -> list
; <bst> ::= (num <bst> <bst>)
;       ::= (num num num)
;       ::= ()
;<list> ::= ()
;       ::= (racketvalue <list>)
;Busca el número ingresado recorriendo el BST y retorna el camino para llegar al número desde el nodo
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

;pruebas
 (path 17 '(14 (7 () (12 () ()))
(26 (20 (17 () ())
())
(31 () ()))))

; aux-prod: list, list -> list
; <list> ::= ()
;        ::= (racketvalue <list>)
; aplica multiplicación entre ambos elementos n de las listas M y V
(define aux-prod
  (lambda (M V) (if (null? M)
                  '()
                  (cons (* (car V)  (car M)) (aux-prod (cdr  M)  (cdr V)) )
               )
                  )

  )


; prod-scalar-matriz: matrix, vector -> list
; <matrix> ::= (<vect> <vect>)
;          ::=
; <vect>   ::= number
;          ::= (number <vect>)
;          
; <list> ::= (racketvalue <list>)
;        ::= ()
; Genera el producto de matriz entre vector

(define prod-scalar-matrix
  (lambda (mat vec)
    (if (or (null? mat) (null? vec))
        '()
        (if (or (null? (car mat)) (null? (car vec)))
            (aux-prod (car mat) vec)
            (cons (aux-prod (car mat) vec) (prod-scalar-matrix (cdr mat) vec)  )
         )
     )
    )
)

;pruebas
(prod-scalar-matrix '((1 2 3) (1 2 3)) '(1 2 3))
(prod-scalar-matrix '((1 2 )(9 9)) '(12 22))