(in-package #:cl-user)
(defpackage #:acronym
  (:use #:common-lisp)
  (:export #:acronym))

(in-package #:acronym)

(defun split-string (string &optional (delimiters '(#\space)))
  "Split STRING into a list of words separated by the any character in the
DELIMITERS list."
  (loop for start = 0 then (1+ end)
        as end = (position-if (lambda (ch) (member ch delimiters)) string :start start)
        as substr = (subseq string start end)
        when (string/= substr "") collect substr
          while end))

(defun first-char-upcase (str)
  "Return the first character of STR in upper case."
  (char-upcase (char str 0)))

(defun acronym (str)
  "Returns the acronym for a noun of tech jargon."
  (map 'string #'first-char-upcase (split-string str '(#\space #\-))))
