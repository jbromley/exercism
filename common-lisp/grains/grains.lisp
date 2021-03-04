(in-package #:cl-user)
(defpackage #:grains
  (:use #:cl)
  (:export :square :total))
(in-package #:grains)

(defun square (n)
  "Return the number of grains on the Nth square."
  (expt 2 (1- n)))

(defun total ()
  "Return the total number of grains on the chessboard."
  (loop for i from 1 to 64 sum (square i)))
