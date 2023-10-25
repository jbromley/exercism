import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  #(place_location.1, place_location.0)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  let place_location = place.1
  treasures
  |> list.filter(fn(t) {
    treasure_location_matches_place_location(place_location, t.1)
  })
  |> list.length()
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case #(found_treasure.0, place.0, desired_treasure.0) {
    #("Brass Spyglass", "Abandoned Lighthouse", _) -> True
    #("Amethyst Octopus", "Stormy Breakwater", desired) ->
      desired == "Crystal Crab" || desired == "Glass Starfish"
    #("Vintage Pirate Hat", "Harbor Managers Office", desired) ->
      desired == "Model Ship in Large Bottle" || desired == "Antique Glass Fishnet Float"
    _ -> False
  }
}
