(in-package #:cl-user)
(defpackage #:etl
  (:use #:common-lisp)
  (:export #:transform))

(in-package #:etl)

(defun transform (data)
  "Transforms hash values into keys with their keys as their values."
  (let ((h (make-hash-table :test 'equalp)))
    (loop for value being the hash-keys of data do
      (loop for key in (gethash value data)
            do (setf (gethash (string-downcase key) h) value)))
    h))
