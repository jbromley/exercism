import gleam/int
import gleam/list
import gleam/result

pub fn is_armstrong_number(number: Int) -> Bool {
  let digits =
    number
    |> int.digits(10)
    |> result.unwrap([0])

  let num_digits = list.length(digits)

  let sum =
    digits
    |> list.fold(0, fn(sum, x) { sum + power(x, num_digits) })

  sum == number
}

fn power(x: Int, power: Int) -> Int {
  power_aux(x, power, 1)
}

fn power_aux(x: Int, power: Int, acc: Int) -> Int {
  case power {
    0 -> acc
    _ -> power_aux(x, power - 1, acc * x)
  }
}
