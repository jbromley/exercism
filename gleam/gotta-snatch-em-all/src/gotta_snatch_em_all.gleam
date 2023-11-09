import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(set.contains(collection, card), set.insert(collection, card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let new_collection =
    collection
    |> set.delete(my_card)
    |> set.insert(their_card)

  case set.contains(collection, their_card), set.contains(collection, my_card) {
    False, True -> #(True, new_collection)
    _, _ -> #(False, new_collection)
  }
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.reduce(fn(acc, coll) { set.intersection(acc, coll) })
  |> result.unwrap(set.new())
  |> set.to_list()
  |> list.sort(string.compare)
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), fn(acc, coll) { set.union(acc, coll) })
  |> set.size()
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) { string.starts_with(card, "Shiny ") })
}
