import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Ok(contents) ->
      Ok(
        contents
        |> string.trim_right
        |> string.split("\n"),
      )

    _ -> Error(Nil)
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path)
  |> result.nil_error()
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n")
  |> result.nil_error()
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let assert Ok(_) = create_log_file(log_path)
  case read_emails(emails_path) {
    Ok(emails) -> {
      emails
      |> list.each(fn(email) {
        case send_email(email) {
          Ok(Nil) -> log_sent_email(log_path, email)
          _ -> Error(Nil)
        }
      })
      Ok(Nil)
    }
    _ -> Error(Nil)
  }
}
