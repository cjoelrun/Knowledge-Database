(define atom? (lambda (x) (or (number? x) (symbol? x) (boolean? x))))

(define knowledge '())

;; Usage (save '(<subject> is <description>")
(define save (lambda (item)
               (parse_save item '())))

(define parse_save (lambda (question subject)
                     (cond ((atom? question) "Usage: (save '(<subject> is <description>")
                           ((null? question) "Usage: (save '(<subject> is <description>")
                           (else (if (equal? (car question) 'is) 
                                     (if (empty? subject) 
                                         "Usage: (save '(<subject> is <description>"
                                         (set! knowledge (cons (list subject (cdr question)) knowledge)))
                                     (parse_save (cdr question) (cons (car question) subject)))))))

(define knowledge? (lambda (subject knowledge)
                     (if (null? knowledge)
                         "This is not in my vast knowledge"
                         (if (equal? (car (car knowledge)) subject)
                             (query_print (cdr (car knowledge)) (string-append (stringify_subject subject "") " is "))
                             (knowledge? subject (cdr knowledge))))))

(define stringify_subject (lambda (symbols string)
                            (if (not (null? symbols))
                                (if (not (null? (cdr symbols))) 
                                    (string-append string (string-append (symbol->string (car symbols)) " "))
                                    (string-append string (symbol->string (car symbols))))
                                string)))

(define stringify_description (lambda (symbols string)
                                (if (not (null? symbols))
                                    (if (not (null? (cdr symbols))) 
                                        (string-append string (string-append (symbol->string (car symbols)) " "))
                                        (string-append string (symbol->string (car symbols))))
                                    string)))
                                    
(define query_print (lambda (description string)
                      (if (not (null? description))
                          (query_print (cdr description) (if (not (null? (cdr description)))
                                                             (string-append string (string-append (stringify_description (car description) " and ")))
                                                             (string-append string (string-append (stringify_description (car description) ".")))))
                          string)))
                          
(define query_parse (lambda (question subject)
                 (cond ((atom? question) "Usage: (query '(What is <subject>")
                       ((null? question) "Usage: (query '(What is <subject>")
                       (else (if (equal? (car question) 'is) 
                                 (if (empty? subject) "Usage: (query '(What is <subject>"
                                     (knowledge? (cdr question) knowledge))
                                 (query_parse (cdr question) (cons (car question) subject)))))))

;; Usage (query '(<What is <subject>")
(define query (lambda (question)
                (query_parse question '())))