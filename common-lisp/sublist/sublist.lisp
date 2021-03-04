(defpackage #:sublist
  (:use #:common-lisp)
  (:export #:sublist))

(in-package #:sublist)

(defun sublist-p (list1 list2 &optional (start 0))
  "Determine if LIST1 is a sublist of LIST2. If LIST1 is longer than
LIST2, NIL is returned."
  (unless (> (length list1) (length list2))
    (let ((match-start (position (first list1) list2 :start start)))
      (cond
        ((null match-start) nil)
        ((> (+ match-start (length list1)) (length list2)) nil)
        ((equal list1 (subseq list2 match-start (+ match-start (length list1)))) t)
        (t (sublist-p list1 list2 (1+ match-start)))))))

(defun sublist (list1 list2)
  "What is LIST1 of LIST2 (sublist, superlist, equal or unequal)"
  (let ((len1 (length list1))
        (len2 (length list2)))
    (cond
      ((equal list1 list2) :equal)
      ((null list1) :sublist)
      ((null list2) :superlist)
      ((< len1 len2)
       (if (sublist-p list1 list2) :sublist :unequal))
      ((> len1 len2)
       (if (sublist-p list2 list1) :superlist :unequal))
      (t :unequal))))
