(in-package #:cl-user)
(defpackage #:bob
  (:use #:cl)
  (:export #:response))
(in-package #:bob)

(defun yellingp (s)
  "Determine if a sentence S is yelling, all letters are upper case."
  (let ((s-letters (remove-if (lambda (c) (not (alpha-char-p c))) s)))
    (and (> (length s-letters) 0) (every #'upper-case-p s-letters))))

(defun questionp (s)
  "Determine if a sentence S is a question, i.e. ends in a question mark."
  (when (> (length s) 0)
    (char= #\? (char s (1- (length s))))))

(defun empty-address-p (s)
  "Determines if the sentence S is an empty address to Bob. That is, it
contains only whitespace characters."
  (if (= (length s) 0)
      t
      (notany (lambda (c) (and (graphic-char-p c) (not (char= #\space c)))) s)))

(defun response (hey-bob)
  (let ((sentence (string-trim +whitespace+ hey-bob)))
    (cond
      ((empty-address-p sentence) "Fine. Be that way!")
      ((and (yellingp sentence) (questionp sentence)) "Calm down, I know what I'm doing!")
      ((yellingp sentence) "Whoa, chill out!")
      ((questionp sentence) "Sure.")
      (t "Whatever."))))
