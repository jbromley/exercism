(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun dividesp (number divisor)
  "Determines if the integer DIVISOR evenly divides NUMBER."
  (zerop (mod number divisor)))

(defun leap-year-p (year)
  "Checks if YEAR is a leap year or not."
  (or (and (dividesp year 4)
           (not (dividesp year 100)))
      (dividesp year 400)))
