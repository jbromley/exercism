import gleam/int
import gleam/string

pub fn egg_count(number: Int) -> Int {
  number
  |> int.to_base2()
  |> count_ones(0)
}

fn count_ones(s: String, acc: Int) -> Int {
  case string.first(s), string.drop_left(s, 1) {
    Ok(ch), rest if ch == "1" -> count_ones(rest, acc + 1)
    Ok(ch), rest if ch == "0" -> count_ones(rest, acc)
    Error(Nil), _ -> acc
  }
}
