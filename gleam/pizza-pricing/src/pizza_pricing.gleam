import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_aux(0, pizza)
}

fn pizza_price_aux(acc: Int, pizza: Pizza) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> pizza_price_aux(acc + 1, p)
    ExtraToppings(p) -> pizza_price_aux(acc + 2, p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base_price = order_price_aux(0, order)
  case list.length(order) {
    1 -> 3 + base_price
    2 -> 2 + base_price
    _ -> base_price
  }
}

fn order_price_aux(price: Int, order: List(Pizza)) -> Int {
  case order {
    [] -> price
    [pizza, ..rest] -> order_price_aux(price + pizza_price(pizza), rest)
  }
}
