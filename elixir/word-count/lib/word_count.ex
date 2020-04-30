defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.codepoints()
    |> Enum.filter(&is_valid_char?(&1))
    |> List.to_string()
    |> String.split(~r/[ _]/, trim: true)
    |> count_aux(%{})
  end

  defp count_aux([word | rest], freqs) do
    case Map.get(freqs, word) do
      nil ->
	count_aux(rest, Map.put(freqs, word, 1))
      val ->
	count_aux(rest, Map.put(freqs, word, val + 1))
    end
  end
  defp count_aux([], freqs) do
    freqs
  end

  def is_valid_char?(char) do
    Regex.match?(~r/[[:alnum:] _-]/u, char)
  end
end
