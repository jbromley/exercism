(ns anagram
  (:require [clojure.string :as s]))

(defn anagram? [word prospect]
  (let [w (s/lower-case word)
        p (s/lower-case prospect)]
    (and (not= w p)
         (= (sort w) (sort p)))))

(defn anagrams-for [word prospect-list]
  (filter (partial anagram? word) prospect-list))
