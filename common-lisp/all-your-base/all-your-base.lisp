(in-package #:cl-user)
(defpackage #:all-your-base
  (:use #:common-lisp)
  (:export #:rebase))

(in-package #:all-your-base)

(defun valid-digit-p (digit base)
  "Determine if DIGIT is valid in the given BASE."
  (and (>= digit 0) (< digit base)))

(defun valid-digits-p (digits base)
  "Determine if all digits in the list DIGITS are valid for the given
BASE."
  (every (lambda (d) (valid-digit-p d base)) digits))

(defun from-base (list-digits in-base)
  "Convert LIST-DIGITS in IN-BASE into an integer."
  (loop for digit in (reverse list-digits)
        for index from 0
        sum (* digit (expt in-base index))))

(defun to-base (n out-base &optional (digits '()))
  "Convert the integer N into the digits in the number represented
in base OUT-BASE."
  (if (zerop n)
      (or digits '(0))
      (multiple-value-bind (q d) (floor n out-base)
        (to-base q out-base (cons d digits)))))

(defun rebase (list-digits in-base out-base)
  "Convert the digits in LIST-DIGITS from a number in IN-BASE to a
number in OUT-BASE. Any base less than two or any list of digits with
an invalid digit for the given IN-BASE returns NIL."
  (when (and (and (>= in-base 2) (>= out-base 2))
             (valid-digits-p list-digits in-base))
    (to-base (from-base list-digits in-base) out-base)))
