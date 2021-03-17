(in-package #:cl-user)
(defpackage #:binary-search
  (:use #:common-lisp)
  (:export #:binary-find #:value-error))

(in-package #:binary-search)

(defun binary-find (arr el &optional (start 0) (end (1- (length arr))))
  "Find the index of the element EL in the vector ARR. If EL is not found
in the vector, return NIL."
  (let ((mid (floor (+ start end) 2)))
    (cond
      ((< mid 0) nil)
      ((= (elt arr mid) el) mid)
      ((<= end start) nil)
      ((< (elt arr mid) el) (binary-find arr el (1+ mid) end))
      (t (binary-find arr el start (1- mid))))))
