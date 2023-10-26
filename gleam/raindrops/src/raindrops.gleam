import gleam/int
import gleam/list

pub fn convert(number: Int) -> String {
  let factors = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

  let s =
    list.fold(
      over: factors,
      from: "",
      with: fn(acc, factor) {
        let #(divisor, sound) = factor
        case number % divisor {
          0 -> acc <> sound
          _ -> acc
        }
      },
    )
  case s {
    "" -> int.to_string(number)
    _ -> s
  }
}
