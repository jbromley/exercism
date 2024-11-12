open Base

let empty = Map.empty (module Char)

let explode str =
  let rec explode_aux cur_index chars = 
    if cur_index < String.length str then
      let new_char = str.[cur_index] in
      explode_aux (cur_index + 1) (chars @ [new_char])
    else chars in
  explode_aux 0 []
    
let count_nucleotide s c =
  let chars = explode s in
  let rec count_nucleotide_aux s count =
    match s with
    | [] -> Result.ok count
    | ch::rest when String.contains "ACGT" ch ->
      count_nucleotide_aux rest (count + (if Char.equal ch c then 1 else 0))
    | ch::_ ->
      Error ch in
  count_nucleotide_aux chars 0

let count_nucleotides s =
  failwith "'count_nucleotides' is missin
