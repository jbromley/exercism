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

  defp rotate_aux([char | rest], shift, cipher) do
    cond do
      char in ?a..?z or char in ?A..?Z ->
	rotate_aux(rest, shift, [char + shift | cipher])
      true ->
	rotate_aux(rest, shift, [char | cipher])
    end
  end
  defp rotate_aux([], _shift, cipher) do
      cipher
      |> List.to_string()
      |> String.reverse()
  end

end
