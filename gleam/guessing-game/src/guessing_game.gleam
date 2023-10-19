pub fn reply(guess: Int) -> String {
  case guess {
    n if n < 41 ->"Too low"
    41 -> "So close"
    42 -> "Correct"
    43 -> "So close"
    n if n > 43 ->"Too high"
  }
}
