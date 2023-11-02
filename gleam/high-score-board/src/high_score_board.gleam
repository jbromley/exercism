import gleam/map.{Map}
import gleam/option.{None, Some}

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
  |> map.drop([player])
}

pub fn update_score(
  score_board: ScoreBoard,
  player: String,
  points: Int,
) -> ScoreBoard {
  case map.has_key(score_board, player) {
    True ->
      map.update(
        score_board,
        player,
        fn(score) {
          case score {
            Some(current_score) -> current_score + points
            None -> 0
          }
        },
      )
    False -> score_board
  }
}

pub fn apply_monday_bonus(score_board: ScoreBoard) -> ScoreBoard {
  score_board
  |> map.map_values(fn(_k, v) { v + 100 })
}
