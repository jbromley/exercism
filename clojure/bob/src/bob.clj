(ns bob
  (:require [clojure.string :as s]))

(defn yelling? [s]
  (and (= s (s/upper-case s))
       (some #(Character/isLetter %1) s)))

(defn question? [s]
  (s/ends-with? s "?"))

(defn nothing-said? [s]
  (= "" (s/trim s)))

(defn response-for [s]
  (cond
    (nothing-said? s) "Fine. Be that way!"
    (and (yelling? s) (question? s)) "Calm down, I know what I'm doing!"
    (yelling? s) "Whoa, chill out!"
    (question? s) "Sure."
    :else "Whatever."))
