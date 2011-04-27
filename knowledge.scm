(define logic '())
(set! logic (cons '(object '(name "Jody")) logic))

(define add_replace (lambda (item)
			(if car

(define parse (lambda (item)
		(set! knowledge (cons
				 (object (name (car item)))
				 (description (cdr (cdr item))) logic))))
(define knowledge '())
(define save (lambda (item)
               (set! knowledge (cons item knowledge))))

(define query (lambda (question)
                knowledge))
;; (Object (name ""))

;; (relationship (description "")
;; 	      (connection '())

'("Jody")
        '(description "an actress")
        '(description "a dancer")


;; (actress (Object)
;; 	 (name "actress"))

;; (is (relationship)
;;     (decription "is")
;;     (connection (Jody actress)))
