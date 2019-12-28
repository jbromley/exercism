(ns reverse-string)

(defn reverse-string [s]
  (loop [rev-str ""
         letters s]
    (if (empty? letters)
      rev-str
      (recur (str (first letters) rev-str)
             (rest letters)))))
