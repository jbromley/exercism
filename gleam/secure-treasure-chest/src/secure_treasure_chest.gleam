import gleam/string

pub opaque type TreasureChest(item) {
  TreasureChest(password: String, treasure: item)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) {
      length if length >= 8 -> Ok(TreasureChest(password, contents))
      _ -> Error("Password must be at least 8 characters long")
    }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
      True -> Ok(chest.treasure)
      _ -> Error("Incorrect password")
    }  
}
