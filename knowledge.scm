(define atom? (lambda (x) (or (number? x) (symbol? x) (boolean? x))))

(define knowledge '())
(define save (lambda (item)
	       (set! logic
		     (cons (cons
			    (car item)
			    (cdr (cdr item)))
			   logic))))
(define print (lambda (subject) 0))
(define search (lambda (question subject)
                 (cond ((atom? question) "Usage: (query '(<subject> is <description>")
                       ((null? question) "Usage: (query '(<subject> is <description>")
                       ((else (if (equal? (car question) "is") (if (empty? subject) "Usage: (query '(<subject> is <description>" 
                                                                   (print subject))
                                  (search question)
				  
				  
				  (define query (lambda (question)
						  (search question '())))