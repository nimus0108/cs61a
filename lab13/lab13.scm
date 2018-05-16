; Q1
(define (compose-all funcs)
  (define (compose-all-recursive ret funcs)
    (if (null? funcs)
        ret
        (compose-all-recursive ((car funcs) ret) (cdr funcs))
    )
  )
  (define (compose-all-helper x)
    (compose-all-recursive x funcs)
  )
  compose-all-helper
)

; Q2
(define (tail-replicate x n)
  (define (tail-replicate-helper ret ct)
    (if (zero? ct)
      ret
      (tail-replicate-helper (cons x ret) (- ct 1))
    )
  )
  (tail-replicate-helper nil n)
)
