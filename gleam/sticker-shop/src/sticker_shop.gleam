import gleam/list
import gleam/result

pub type Usd

pub type Eur

pub type Jpy

pub opaque type Money(unit) {
  Money(amount: Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  prices
  |> list.reduce(fn(acc, x) { Money(acc.amount + x.amount) })
  |> result.unwrap(Money(0))
}
