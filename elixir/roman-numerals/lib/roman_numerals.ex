defmodule RomanNumerals do
  @sym_table [{1000, "M"}, {900, "MC"}, {500, "D"}, {400, "DC"}, {100, "C"}, {90, "CX"}, {50, "L"}, {40, "LX"}, {10, "X"}, {9, "XI"}, {5, "V"}, {4, "VI"}, {1, "I"}] 

  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    numeral_aux(number, @sym_table, [])
  end
  defp numeral_aux(0, _sym_list, n_roman) do
    n_roman |> List.to_string() |> String.reverse()
  end
  defp numeral_aux(n, symbol_list, n_roman) do
    {val, symbol} = hd(symbol_list)
    if n < val do
      numeral_aux(n, tl(symbol_list), n_roman)
    else 
      numeral_aux(n - val, symbol_list, [symbol | n_roman])
    end
  end
end
