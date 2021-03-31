#lang racket

(provide rebase)

(require predicates)

(define (valid-digit? digit base)
  (and (>= digit 0) (< digit base)))

(define (valid-digits? digits base)
  (all? valid-digit?))

; (define (from-base digit-list in-base)


(define (rebase list-digits in-base out-base)
  #f)
