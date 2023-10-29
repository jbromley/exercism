const sym_table = [
  #(1000, "M"),
  #(900, "CM"),
  #(500, "D"),
  #(400, "CD"),
  #(100, "C"),
  #(90, "XC"),
  #(50, "L"),
  #(40, "XL"),
  #(10, "X"),
  #(9, "IX"),
  #(5, "V"),
  #(4, "IV"),
  #(1, "I"),
]

pub fn convert(number: Int) -> String {
  convert_aux(number, sym_table, "")
}

fn convert_aux(number: Int, syms: List(#(Int, String)), roman: String) -> String {
  case number, syms {
    0, _ -> roman
    _, [] -> todo as "empty symbol table!"
    n, [#(val, _symbol), ..rest] if n < val -> convert_aux(n, rest, roman)
    n, [#(val, symbol), ..] -> convert_aux(n - val, syms, roman <> symbol)
  }
}
