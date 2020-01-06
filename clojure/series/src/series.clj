(ns series)

(defn slices [string length]
  (cond
    (or (empty? string) (> length (count string))) []
    (zero? length) [""]
    :else (map clojure.string/join (partition length 1 string))))

