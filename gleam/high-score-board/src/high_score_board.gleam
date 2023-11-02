import gleam/map.{Map}

pub type ScoreBoard =
  Map(String, Int)

pub fn create_score_board() -> ScoreBoard {
  map.new()
  |> map.insert("The Best Ever", 1_000_000)
}

pub fn add_player(
  score_board: ScoreBoard,
  player: String,
  score: Int,
) -> ScoreBoard {
  score_board
  |> map.insert(player, score)
}

pub fn remove_player(score_board: ScoreBoard, player: String) -> ScoreBoard {
  score_board
  |> map.delete(player)
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case map.get(score_board, player) {
    Ok(score) -> map.insert(score_board, player, score + points)
    _ -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> map.map_values(fn(_player, score) { score + 100 })
}
