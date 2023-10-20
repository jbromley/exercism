pub fn square_of_sum(n: Int) -> Int {
  let sum = n * { n + 1 } / 2
  sum * sum
}

pub fn sum_of_squares(n: Int) -> Int {
  sum_of_squares_aux(n, 0)
}

fn sum_of_squares_aux(n: Int, sum: Int) -> Int {
  case n {
    0 -> sum
    _ -> sum_of_squares_aux(n - 1, sum + n * n)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
