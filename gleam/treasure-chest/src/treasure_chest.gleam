pub type TreasureChest(item) {
  TreasureChest(String, item)
}

pub type UnlockResult(item) {
  Unlocked(item)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password_try: String,
) -> UnlockResult(treasure) {
  case chest {
    TreasureChest(password, treasure) if password == password_try ->
      Unlocked(treasure)
    TreasureChest(_, _) -> WrongPassword
  }
}
