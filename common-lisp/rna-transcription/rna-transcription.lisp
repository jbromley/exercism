(in-package #:cl-user)
(defpackage #:rna-transcription
  (:use #:cl)
  (:export #:to-rna))
(in-package #:rna-transcription)

(defparameter *transcription-map* '((#\A . #\U)
                                    (#\C . #\G)
                                    (#\G . #\C)
                                    (#\T . #\A)))
(defun to-rna-base (base)
  "Transcribe a single DNA base to the RNA complement. Return NIL if the
base is not a valid base (A, C, G, T)."
  (cdr (assoc base *transcription-map*)))

(defun to-rna (str)
  "Transcribe a string representing DNA nucleotides to RNA."
  (let ((transcription (map 'list #'to-rna-base str)))
    (if (not (member nil transcription))
        (coerce transcription 'string)
        (error "invalid base"))))
