(ns collatz-conjecture)

(defn collatz-step [num]
  (if (even? num)
    (/ num 2)
    (+ (* 3 num) 1)))

(defn count-collatz-steps [num]
  (loop [n num
         steps 0]
    (if (= n 1)
      steps
      (recur (collatz-step n) (inc steps)))))

(defn collatz [num]
  (cond
    (zero? num) (throw (Exception. "zero is an error"))
    (neg? num) (throw (Exception. "negative value is an error"))
    :else (count-collatz-steps num)))
