import gleam/string

pub fn message(log_line: String) -> String {
  let [_, msg] = string.split(log_line, on: ":")
  msg
  |> string.trim()
}

pub fn log_level(log_line: String) -> String {
  let [level, _] = string.split(log_line, on: ":")
  level
  |> string.drop_left(up_to: 1)
  |> string.drop_right(up_to: 1)
  |> string.lowercase()
}

pub fn reformat(log_line: String) -> String {
  let level = log_level(log_line)
  let msg = message(log_line)
  msg <> " (" <> level <> ")"
}
