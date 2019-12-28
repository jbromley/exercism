(ns anagram
  (:require [clojure.string :as s]))

(defn anagrams-for [word prospect-list]
  (let [word-lower (s/lower-case word)
        word-chars (sort word-lower)]
    (filter #(and (= word-chars (sort (s/lower-case %1)))
                  (not= word-lower (s/lower-case %1))) prospect-list)))
