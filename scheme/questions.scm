(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
  'replace-this-line)

(define (zip pairs)
  (if (null? pairs)
    '(() ())
    (let ((first (car pairs))
          (rest (zip (cdr pairs)))
         )
         (cons (cons (car first) 
                     (car rest)
               )
               (cons (cons (cadr first)
                           (cadr rest)
                     )
                     nil
               )
         )
    )
  )
)

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (enumerate_helper i lst)
    (if (null? lst)
      nil
      (cons (cons i (cons (car lst) nil))
            (enumerate_helper (+ i 1) (cdr lst))
      )
    )
  )

  (enumerate_helper 0 s)
)
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (cond ((zero? total) '(()))
        ((or (< total 0) (null? denoms)) nil)
        (else (append (cons-all (car denoms)
                                (list-change (- total (car denoms))
                                             denoms
                                )
                      )
                      (list-change total (cdr denoms))
              )
        )
  )
)
  ; END PROBLEM 18

(define (cons-all num lst)
  ; num - the number added to the first place
  ; lst - a list of list elements
  (if (null? lst)
    nil
    (cons (append (cons num nil) (car lst))
          (cons-all num (cdr lst))
    )
  )
) 

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         ; (cons 'quote 
               ; (let-to-lambda (cdr expr))
         ; )
         expr
         ; END PROBLEM 19
        )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons form (cons params (let-to-lambda body)))
           ; END PROBLEM 19
         )
        )
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (if (list? values)
             (let ((params_args (zip values)))
                  (cons (cons 'lambda
                              (cons (car params_args)
                                    (let-to-lambda body)
                              )
                        )
                        (let-to-lambda (cadr params_args))
                  )
             )
             expr
           )
           ; END PROBLEM 19
         )
        )
        (else
         ; BEGIN PROBLEM 19
         (cons (let-to-lambda (car expr))
               (let-to-lambda (cdr expr))
         )
         ; END PROBLEM 19
        )
  )
)
