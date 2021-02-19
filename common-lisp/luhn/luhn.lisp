(in-package #:cl-user)
(defpackage #:luhn
  (:use #:cl)
  (:export #:validp))

(in-package #:luhn)

(defun to-luhn-digit (n)
  "Double the value of the digit. If the double value is greater than
nine, then subtract nine from the doubled value."
  (let ((n2 (* 2 n)))
    (if (> n2 9)
        (- n2 9)
        n2)))

(defun luhn-checksum (list)
  "Calculate the Luhn checksum for the list of characters."
  (loop
    for (n1 n2) on (reverse list) by #'cddr
    sum n1
    when n2 sum (to-luhn-digit n2)))

(defun validp (input)
  "Check if a number has a valid Luhn checksum."
  (let ((digits (map 'list #'digit-char-p
                        (remove #\Space input))))
    (when (and (> (length digits) 1) (not (member nil digits)))
      (zerop (mod (luhn-checksum digits) 10)))))
