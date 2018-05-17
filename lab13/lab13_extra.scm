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
  (define (insert-helper lt gt)
    (if (or (null? gt) (<= n (car gt)))
        (app lt (cons n gt))
        (insert-helper (cons (car gt) lt) (cdr gt))
    )
  )
  (define (app lst ret)
    (if (null? lst)
        ret
        (app (cdr lst) (cons (car lst) ret))
    )
  )

  (insert-helper nil s)
)

; Q6
(define (deep-map fn s)
  (if (null? s)
      nil
      (if (list? (car s))
          (cons (deep-map fn (car s)) (deep-map fn (cdr s)))
          (cons (fn (car s)) (deep-map fn (cdr s)))
      )
  )
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
(define (unique? name s)
  (if (null? s)
      #t
      (if (equal? name (car (car s)))
          #f
          (unique? name (cdr s))
      )
  )
)

(define (count name s)
  (map (lambda (record) 
               (if (equal? name (car record))
                   (cons name (+ 1 (cdr record)))
                   record
               )
       )
       s
  )
)

(define (tally names)
  (define (tally-helper ret names)
    (if (null? names)
        ret
        (let ((first (car names)) (rest (cdr names)))
          (if (unique? first ret)
              (tally-helper (append ret (list (cons first 1)))
                            rest)
              (tally-helper (count first ret) rest)
          )
        )
    )
  )
  (tally-helper nil names)
)
