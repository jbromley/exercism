#lang racket
(provide my-reverse)

(define (my-reverse s)
  (letrec ([rev (lambda (s rs)
                  (if (= (string-length s) 0)
                      rs
                      (rev (substring s 1) (string-append (substring s 0 1) rs))))])
    (rev s "")))
