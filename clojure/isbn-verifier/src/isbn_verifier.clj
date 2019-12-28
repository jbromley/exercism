(ns isbn-verifier
  (:require [clojure.string :as s]))

(defn isbn? [isbn]
  (if-let [isbn-clean (re-matches #"^\d{9}[\dX]$" (s/replace isbn "-" ""))]
    (= 0 (mod (reduce + (map * (range 10 0 -1)
                             (map #(Integer/parseInt %1 16)
                                  (s/split (s/replace isbn-clean "X" "A") #"")))) 11))
    false))
