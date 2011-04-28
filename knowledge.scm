(define atom? (lambda (x) (or (number? x) (symbol? x) (boolean? x))))

(define knowledge '())

;; Usage (save '(Judy is an actress))
(define save (lambda (item)
	       (set! knowledge
		     (cons (cons
			    (car item)
                            (cdr (cdr item)))
			   knowledge))))

(define find (lambda (subject) 0))

(define search (lambda (question subject)
                 (cond ((atom? question) "Usage: (query '(<subject> is <description>")
                       ((null? question) "Usage: (query '(<subject> is <description>")
                       (else (if (equal? (car question) "is") (if (empty? subject) "Usage: (query '(<subject> is <description>" 
                                                                   (print subject))
                                  (search (cdr question) (cons (car question) subject)))))))
                 
                
(define query (lambda (question)
                (search question '())))