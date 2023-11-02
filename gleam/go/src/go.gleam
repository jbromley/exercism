import gleam/result

pub type Player {
  Black
  White
}

pub type Game {
  Game(
    white_captured_stones: Int,
    black_captured_stones: Int,
    player: Player,
    error: String,
  )
}

pub fn apply_rules(
  game: Game,
  rule1: fn(Game) -> Result(Game, String),
  rule2: fn(Game) -> Game,
  rule3: fn(Game) -> Result(Game, String),
  rule4: fn(Game) -> Result(Game, String),
) -> Game {
  let next_game =
    rule1(game)
    |> result.map(rule2(_))
    |> result.try(rule3(_))
    |> result.try(rule4(_))

  case next_game {
    Ok(g) -> Game(..g, player: next_player(game))
    Error(msg) -> Game(..game, error: msg)
  }
}

fn next_player(game: Game) -> Player {
  case game.player {
    Black -> White
    White -> Black
  }
}
