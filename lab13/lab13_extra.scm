; Q4
(define (rle s)
  (define (rle-helper s previous ct)
    (cond ((null? s)
           (if (zero? ct)
               nil
               (cons-stream (list previous ct) nil)
           )
          )
          ((not (equal? previous (car s)))
           (cons-stream (list previous ct) (rle s))
          )
          (else (rle-helper (cdr-stream s) previous (+ 1 ct)))
    )
  )
  (if (null? s)
    nil
    (rle-helper s (car s) 0)
  )
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  'YOUR-CODE-HERE
)

; Q6
(define (deep-map fn s)
  'YOUR-CODE-HERE
  nil
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.
(define (unique s)
  'YOUR-CODE-HERE
  nil
)

(define (count name s)
  'YOUR-CODE-HERE
  nil
)

(define (tally names)
  'YOUR-CODE-HERE
  nil
)
