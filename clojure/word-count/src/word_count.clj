(ns word-count
  (:require [clojure.string :as s]))

(defn clean-string [s]
  (s/join "" (filter #(or (Character/isLetter %1)
                          (Character/isSpace %1)
                          (Character/isDigit %1)) s)))

(defn word-count [words]
  (->> words
       (s/lower-case)
       (clean-string)
       (#(s/split %1 #"[ ]+"))
       (sort)
       (partition-by identity)
       (mapcat (juxt first count))
       (apply hash-map)))

(defn word-count-2 [words]
  (frequencies (re-seq #"\w+" (s/lower-case words))))
