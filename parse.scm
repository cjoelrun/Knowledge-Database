(record-class class_info spec)

(define class_parse (record-class 'parse '(full full)))

(define cons_parse   (car class_parse))
(define sel_parse    (caddr class_parse))
(define tree_parse   (car sel_parse))
(define rest_parse   (cadr sel_parse))

(define (member? x list)
  (if (null? list) #f
      (if (equal? x (car list)) #t
	  (member? x (cdr list)))))

(define parse_determiner
  (lambda (list_of_tokens)
    (cond
     ((null? list_of_tokens) #f)
     ((member? (car list_of_tokens) '(a the)) ; (1) determiner?
      (cons_parse                             ; (2) yes!, make parse
       (car list_of_tokens)                ; (3) tree
       (cdr list_of_tokens)))              ; (4) unparsed list
     (else   #f )                            ; (5) no. fail
     )   ; end cond
    )       ; end lambda
  )           ; end definition

(define noun '(cat dog child woman man bone cabbage canary))

(define parse_noun
  (lambda (list_of_tokens)
    (cond
     ((null? list_of_tokens) #f)
     ((member? (car list_of_tokens) noun)     ; (1) noun?
      (cons_parse                             ; (2) yes!, make parse
       (car list_of_tokens)                ; (3) tree
       (cdr list_of_tokens)))              ; (4) unparsed list
     (else   #f )                            ; (5) no. fail
     )   ; end cond
    )       ; end lambda
  )           ; end definition

(define parse_noun_phrase
  (lambda (list_of_tokens)
    (let ((p_det (parse_determiner list_of_tokens)))     ; (1)
      (if p_det                                        ; (2)
	  (let ( (p_n (parse_noun (rest_parse p_det)))); (3)
	    (if p_n                                  ; (4)
		(cons_parse                          ; (5)
		 (list 'noun_phrase               ; (6)
		       (tree_parse p_det)           ; (7)
		       (tree_parse p_n))            ; (8)
		 (rest_parse p_n)                 ; (9)
		 )                                ;
		#f)                                  ;(10)
	    );end let                                ;
	  #f)                                          ;(11)
      );end let                                        ;
    )); end def. parse_noun_phrase                       ;

(define verb '(likes eats hugs))


(define parse_verb
  (lambda (list_of_tokens)
    (cond
     ((null? list_of_tokens) #f)
     ((member? (car list_of_tokens) verb)     ; (1) verb?
      (cons_parse                             ; (2) yes!, make parse
       (car list_of_tokens)                ; (3) tree
       (cdr list_of_tokens)))              ; (4) unparsed list
     (else   #f )                            ; (5) no. fail
     )   ; end cond
    )       ; end lambda
  )           ; end definition

(define parse_verb_phrase
  (lambda (list_of_tokens)
    (let ((p1 (parse_verb list_of_tokens)))
      (if p1
	  (let ((p2 (parse_noun_phrase (rest_parse p1))))
	    (if p2
		(cons_parse
		 (list 'verb_phrase
		       (tree_parse p1)
		       (tree_parse p2))
		 (rest_parse p2)
		 )
		#f)
	    ) ;end let
	  #f)
      );end let
    )); end def. parse_verb_phrase

(define parse_sentence
  (lambda (list_of_tokens)
    (let ((p1 (parse_noun_phrase list_of_tokens)))
      (if p1
	  (let ((p2 (parse_verb_phrase (rest_parse p1))))
	    (if p2
		(cons_parse
		 (list 'sentence
		       (tree_parse p1)
		       (tree_parse p2))
		 (rest_parse p2)
		 )
		#f)
	    ) ;end let
	  #f)
      );end let
    )); end def. parse_sentence

(trace parse_verb_phrase)
(trace parse_verb)
(trace parse_noun_phrase)

(parse_verb_phrase '(eats the canary))