type nucleotide = A | C | G | T

let hamming_distance (x: nucleotide list) (y: nucleotide list) = 
  match List.length x, List.length y with
  | len_x, len_y when len_x = len_y ->
    List.fold_left (+) 0 (List.map2 (fun x y -> if x = y then 0 else 1) x y) |> Result.ok
  | 0, _ -> Error "left strand must not be empty"
  | _, 0 -> Error "right strand must not be empty"
  | _, _ -> Error "left and right strands must be of equal length"
