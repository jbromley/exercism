(ns rna-transcription
  (:require [clojure.string :as s]))

(def trans-map (apply hash-map ["G" "C" "C" "G" "T" "A" "A" "U"]))

(defn is-dna? [dna]
  (not (some nil? (map #(trans-map %1) (s/split dna #"")))))

(defn to-rna [dna]
  (assert (is-dna? dna))
  (s/join (map #(trans-map %1) (s/split dna #""))))
