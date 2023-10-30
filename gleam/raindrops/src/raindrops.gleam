import gleam/int
import gleam/string

pub fn convert(number: Int) -> String {
  let s =
    ""
    |> raindrop(number, 3, "Pling")
    |> raindrop(number, 5, "Plang")
    |> raindrop(number, 7, "Plong")

  case string.is_empty(s) {
    True -> int.to_string(number)
    False -> s
  }
}

fn raindrop(acc: String, number: Int, divisor: Int, sound: String) -> String {
  case number % divisor {
    0 -> acc <> sound
    _ -> acc
  }
}
