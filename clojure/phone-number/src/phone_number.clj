(ns phone-number)

(defn number [num-string]
  (let [digits (clojure.string/replace num-string #"[^\d]" "")]
    (condp re-matches digits
      #"^[\d]{10}$" digits
      #"^1[\d]{10}$" (subs digits 1)
      "0000000000")))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn pretty-print [num-string]
  (let [num (number num-string)]
    (format "(%s) %s-%s" (subs num 0 3) (subs num 3 6) (subs num 6))))
