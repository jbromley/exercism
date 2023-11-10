import gleam/int

pub fn egg_count(number: Int) -> Int {
  case number {
    0 -> 0
    n -> int.bitwise_and(n, 1) + egg_count(int.bitwise_shift_right(n, 1))
  }
}
