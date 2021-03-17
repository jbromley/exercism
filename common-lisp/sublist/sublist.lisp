(defpackage #:sublist
  (:use #:common-lisp)
  (:export #:sublist))

(in-package #:sublist)

(defun sublistp (list1 list2)
  "Determine if LIST1 is a sublist of LIST2. If LIST1 is longer than
LIST2, NIL is returned."
  (search list1 list2))

(defun sublist (list1 list2)
  "What is LIST1 of LIST2 (sublist, superlist, equal or unequal)"
  (cond
    ((equal list1 list2) :equal)
    ((sublistp list1 list2) :sublist)
    ((sublistp list2 list1) :superlist)
    (t :unequal)))
