(in-package #:cl-user)
(defpackage #:two-fer
  (:use #:cl)
  (:export #:twofer))
(in-package #:two-fer)

(defun twofer (&optional (name "you"))
  (format nil "One for ~a, one for me."
          (if (null name) "you" name)))
