defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist()
    |> rotate_aux(shift, [])
  end

  defp rotate_aux([char | rest], shift, cipher) when char >= ?a and char <= ?z do
    rotate_aux(rest, shift, [?a + rem((char - ?a) + shift, 26) | cipher])
  end
  defp rotate_aux([char | rest], shift, cipher) when char >= ?A and char <= ?Z do
    rotate_aux(rest, shift, [?A + rem((char - ?A) + shift, 26) | cipher])
  end
  defp rotate_aux([char | rest], shift, cipher) do
	rotate_aux(rest, shift, [char | cipher])
  end
  defp rotate_aux([], _shift, cipher) do
      cipher
      |> List.to_string()
      |> String.reverse()
  end

end
