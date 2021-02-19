(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun occurrences (str)
  "Count the number occurrences of each element of the string STR.
Return an alist sorted by the element."
  (let* ((counts (make-hash-table :test 'equalp)))
    (loop for letter across str
          do (if (gethash letter counts)
                 (incf (gethash letter counts))
                 (setf (gethash letter counts) 1)))
    counts))


(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (let ((subject-freqs (occurrences subject)))
    (loop for c in candidates
          when (and (equalp subject-freqs (occurrences c))
                    (not (string-equal subject c)))
            collect c)))
