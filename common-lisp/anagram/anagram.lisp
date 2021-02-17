(in-package #:cl-user)
(defpackage #:anagram
  (:use #:common-lisp)
  (:export #:anagrams-for))

(in-package #:anagram)

(defun occurrences (str)
  "Count the number occurrences of each element of the string STR.
Return an alist sorted by the element."
  (let* ((lst (coerce str 'list))
         (elements (remove-duplicates lst))
         (counts (pairlis elements (make-list (length elements) :initial-element 0))))
    (loop for x in lst
          do (incf (cdr (assoc x counts))))
    (sort counts #'char< :key #'car)))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (let* ((subject-lc (string-downcase subject))
         (subject-freqs (occurrences subject-lc)))
    (loop for candidate in candidates
          for candidate-lc = (string-downcase candidate)
          when (and (equal subject-freqs (occurrences candidate-lc))
                    (not (equal subject-lc candidate-lc)))
            collect candidate)))
