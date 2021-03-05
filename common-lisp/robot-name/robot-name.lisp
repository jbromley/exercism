(in-package #:cl-user)
(defpackage #:robot
  (:use #:common-lisp)
  (:export #:build-robot #:robot-name #:reset-name))

(in-package #:robot)

;; (defvar *robot-name-db* (list)
;;   "Database that holds all used robot names.")
(defvar *robot-name-db* (make-hash-table :test 'equal)
  "Database that holds all used robot names.")

(defun random-letter ()
  "Generate a random capital letter."
  (code-char (+ 65 (random 26))))

;; (defun name-unused-p (name)
;;   "Check if NAME has already been used as a robot name. Returns t if NAME has
;; not been used before and NIL if the name has been used."
;;   (not (member name *robot-name-db* :test #'string=)))

(defun name-unused-p (name)
  "Check if NAME has already been used as a robot name. Returns t if NAME has
not been used before and NIL if the name has been used."
  (not (gethash name *robot-name-db*)))

(defun names-available-p ()
  "Returns if the name database is full or not."
  (< (hash-table-count *robot-name-db*) (* 26 26 10 10 10)))

;; (defun use-name (name)
;;   "Use NAME for a robot. This records NAME in the robot name database so it
;; cannot be reused. Returns the name."
;;   (car (pushnew name *robot-name-db* :test #'string=)))

(defun use-name (name)
  "Use NAME for a robot. This records NAME in the robot name database so it
cannot be reused. Returns the name."
  (setf (gethash name *robot-name-db*) t)
  name)

(defun generate-name ()
  "Generate a unique robot name of two capital letters and then three digits."
  (when (not (names-available-p))
    (error "All names used"))
  (flet ((create-name ()
           (format nil "~a~a~3,'0d" (random-letter) (random-letter) (random 1000))))
    (do ((name (create-name) (create-name)))
        ((name-unused-p name) (use-name name)))))

(defstruct robot
  (name (generate-name) :type string))

(defun build-robot ()
  "Build a robot and give it a unique name."
  (make-robot))

(defun reset-name (robot)
  "Reset the name for ROBOT to a previously unused name."
  (setf (robot-name robot) (generate-name)))
