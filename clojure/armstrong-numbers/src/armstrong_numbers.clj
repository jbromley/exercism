(ns armstrong-numbers
  (:require [clojure.math.numeric-tower :as nt]))

(defn armstrong? [num]
  (let [digits (map #(Integer/parseInt %1 10)
                    (clojure.string/split (str num) #""))
        n (count digits)]
    (= num (reduce + (map #(nt/expt %1 n) digits)))))

