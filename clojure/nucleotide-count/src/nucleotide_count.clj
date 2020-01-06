(ns nucleotide-count)

(def nucleotides #{\A \C \G \T})

(defn count-of-nucleotide-in-strand [nucleotide strand]
  (assert (not (nil? (nucleotides nucleotide))))
  (or ((nucleotide-counts (filter #(= nucleotide %1) strand)) nucleotide) 0))

(defn nucleotide-counts [strand]
  (let [freqs (frequencies strand)]
    (reduce conj freqs (for [k nucleotides :when (nil? (freqs k))]
                         (assoc freqs k 0)))))
