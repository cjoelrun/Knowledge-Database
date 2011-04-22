(define knowledge '())

(define save (lambda (item)
               (set! knowledge (cons item knowledge))))

(define query (lambda (question)
                knowledge))
