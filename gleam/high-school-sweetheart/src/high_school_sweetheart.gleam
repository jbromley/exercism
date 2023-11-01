import gleam/list
import gleam/result
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim()
  |> string.first()
  |> result.unwrap("")
}

pub fn initial(name: String) {
  name
  |> first_letter()
  |> string.uppercase()
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(on: " ")
  |> list.map(initial)
  |> list.intersperse(" ")
  |> string.concat()
}

pub fn pair(full_name1: String, full_name2: String) {
  "\n" <> "     ******       ******\n" <> "   **      **   **      **\n" <> " **         ** **         **\n" <> "**            *            **\n" <> "**                         **\n" <> "**     " <> initials(
    full_name1,
  ) <> "  +  " <> initials(full_name2) <> "     **\n" <> " **                       **\n" <> "   **                   **\n" <> "     **               **\n" <> "       **           **\n" <> "         **       **\n" <> "           **   **\n" <> "             ***\n" <> "              *\n"
}
