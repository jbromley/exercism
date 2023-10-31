pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_aux(pizza, 0)
}

fn pizza_price_aux(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(p) -> pizza_price_aux(p, acc + 1)
    ExtraToppings(p) -> pizza_price_aux(p, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let size_fee = case order {
    [_] -> 3
    [_, _] -> 2
    _ -> 0
  }

  order_price_aux(order, size_fee)
}

fn order_price_aux(order: List(Pizza), price: Int) -> Int {
  case order {
    [] -> price
    [pizza, ..rest] -> order_price_aux(rest, price + pizza_price(pizza))
  }
}
