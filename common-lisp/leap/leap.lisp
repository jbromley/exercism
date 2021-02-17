(defpackage #:leap
  (:use #:common-lisp)
  (:export #:leap-year-p))
(in-package #:leap)

(defun leap-year-p (year)
  "Return if YEAR is a leap year or not."
  (or (and (= (mod year 4) 0)
           (not (= (mod year 100) 0)))
      (= (mod year 400) 0)))
