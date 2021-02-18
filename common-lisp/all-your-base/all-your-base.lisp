(in-package #:cl-user)
(defpackage #:all-your-base
  (:use #:common-lisp)
  (:export #:rebase))

(in-package #:all-your-base)

(defun from-base (list-digits in-base)
  "Convert LIST-DIGITS in IN-BASE into an integer."
  (loop for digit in (reverse list-digits)
        for index from 0
        sum (* digit (expt in-base index))))

(defun to-base (n out-base)
  "Convert the number N into the digits in the number represented
in base OUT-BASE."


(defun rebase (list-digits in-base out-base))
