(in-package #:cl-user)
(defpackage #:word-count
  (:use #:cl)
  (:export #:count-words))
(in-package #:word-count)

(defun split-string (string &optional (delimiters '(#\space)))
  "Split STRING into a list of words separated by the any character in the
DELIMITERS list."
  (loop for start = 0 then (1+ end)
        as end = (position-if (lambda (ch) (member ch delimiters)) string :start start)
        as substr = (subseq string start end)
        when (string/= substr "") collect substr
          while end))

(defun clean-string (s)
  "Downcase a string S and replace all characters except for letters, numbers,
and the apostrophe with spaces."
  (string-downcase
   (substitute-if #\space
                  (lambda (c)
                    (not (or (alpha-char-p c) (digit-char-p c) (equal c #\apostrophe))))
                  s)))

(defun trim-word-list (word-list)
  "Remove apostrophes from begin and ending of words in a list."
  (mapcar (lambda (w) (string-trim "'" w)) word-list))

(defun add-word (word word-list)
  "If WORD exists as a key in the alist WORD-LIST then increment the count
of its occurrences. If it does not exist, add it to the list."
  (let ((place (assoc word word-list :test #'string=)))
    (cond
      ((null place) (acons word 1 word-list))
      (t (incf (cdr place))
         word-list))))

(defun count-words (sentence)
  "Count the occurrences of each word in a sentence."
  (let ((words (trim-word-list (split-string (clean-string sentence)))))
    (labels ((count-words-aux (ws counts)
               (if (null ws)
                   counts
                   (count-words-aux (rest ws) (add-word (first ws) counts)))))
      (nreverse (count-words-aux words '())))))
