(ns collatz-conjecture)

(defn collatz-step [num]
  (if (even? num)
    (/ num 2)
    (+ (* 3 num) 1)))

(defn collatz [num]
  (assert (pos? num))
  (loop [n num
         steps 0]
    (if (= n 1)
      steps
      (recur (collatz-step n) (inc steps)))))
