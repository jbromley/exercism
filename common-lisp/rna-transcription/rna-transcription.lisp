(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defconstant +transcription-map+ '((#\A . #\U)
                                   (#\C . #\G)
                                   (#\G . #\C)
                                   (#\T . #\A)))

(defun to-rna-base (base)
  "Transcribe a single DNA base to the RNA complement. Raise an error if
the base is not a valid base (A, C, G, T)."
  (or (cdr (assoc base +transcription-map+))
        (error (format nil "invalid base: ~a" base))))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (map 'string #'to-rna-base str))
