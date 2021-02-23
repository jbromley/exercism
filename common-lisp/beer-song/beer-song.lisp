(in-package #:cl-user)
(defpackage #:beer
  (:use #:common-lisp)
  (:export #:verse #:sing))

(in-package #:beer)

(defun verse (n)
  "Returns a string verse for a given number."
  (if (zerop n)
      (format nil "No more bottles of beer on the wall, no more bottles of beer.~%Go to the store and buy some more, 99 bottles of beer on the wall.~%")
      (format nil "~a bottle~:p of beer on the wall, ~a bottle~:p of beer.~%Take ~[one~;it~:;one~] down and pass it around, ~a bottle~:p of beer on the wall.~%" n n n (if (> n 1) (1- n) "no more"))))

(defun sing (start &optional (end 0))
  "Returns a string of verses for a given range of numbers."
  (loop for bottles from start downto end
        collecting (verse bottles) into verses
        finally (return (format nil "~{~a~%~}" verses))))
