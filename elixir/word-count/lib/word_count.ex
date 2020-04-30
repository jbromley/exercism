defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> select_words()
    |> List.flatten()
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

  defp select_words(sentence) do
    Regex.scan(~r/[[:alnum:]-]+/u, sentence)
  end
end
