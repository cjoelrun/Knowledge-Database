(define logic '())
(set! logic (cons '(object '(name "Jody")) logic))
(define add_replace (lambda (item)
			(if car

(define parse (lambda (item)
		(set! knowledge (cons
				 (object (name (car item)))
				 (relationship 
				  logic))))
(define knowledge '())
(define save (lambda (item)
               (set! knowledge (cons item knowledge))))

(define query (lambda (question)
                knowledge))
;; (Object (name ""))

;; (relationship (description "")
;; 	      (connection '())

;; (Jody (Object)
;;       (name "Jody"))

;; (actress (Object)
;; 	 (name "actress"))

;; (is (relationship)
;;     (decription "is")
;;     (connection (Jody actress)))