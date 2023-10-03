import gleam/int
import gleam/float
import gleam/string


pub fn pence_to_pounds(pence) {
  int.to_float(pence) /. 100.0
}

pub fn pounds_to_string(pounds) {
  let pounds_str = float.to_string(pounds)
  let assert Ok(#(_, cents)) = string.split_once(pounds_str, on: ".")
  let pounds_str = case string.length(cents) {
    0 -> string.append(to: pounds_str, suffix: "00")
    1 -> string.append(to: pounds_str, suffix: "0")
    _ -> pounds_str
  }
  string.concat(["£", pounds_str])
}
