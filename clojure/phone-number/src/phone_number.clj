(ns phone-number)

(defn clean [string]
  (apply str (remove #((set "+()-. ") %1) string)))

(defn number [num-string]
  (let [num (clean num-string)
        num-len (count num)]
    (cond
      (= num-len 10) num
      (and (= num-len 11) (= (first num) \1)) (subs num 1)
      :default "0000000000")))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn pretty-print [num-string]
  (let [num (number num-string)]
    (format "(%s) %s-%s"
            (subs num 0 3)
            (subs num 3 6)
            (subs num 6))))
