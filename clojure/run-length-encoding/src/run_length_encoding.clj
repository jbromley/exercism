(ns run-length-encoding)

(defn run-length-encode
  "Encodes a string with run-length-encoding."
  [plain-text]
  (->> (partition-by identity plain-text)
       (mapcat (juxt count first))
       (filter #(not= 1 %1))
       (apply str)))

(defn run-length-decode
  "Decodes a run-length-encoded string."
  [cipher-text]
  (->> (re-seq #"(\d*)([A-Za-z ])" cipher-text)
       (mapcat (fn [[_ n ch]] (if (empty? n)
                                ch
                                (repeat (Integer/parseInt n) ch))))
       (apply str)))
