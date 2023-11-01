import gleam/int
import gleam/iterator
import gleam/list
import gleam/set.{Set}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.map(multiples_up_to(_, limit))
  |> list.fold(set.new(), set.union)
  |> set.fold(0, int.add)
}

fn multiples_up_to(base: Int, limit: Int) -> Set(Int) {
  case base {
    0 -> set.new()
    _ ->
      iterator.iterate(base, fn(x) { x + base })
      |> iterator.take_while(fn(x) { x < limit })
      |> iterator.to_list()
      |> set.from_list()
  }
}
