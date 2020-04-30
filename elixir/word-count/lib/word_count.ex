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
    |> Enum.frequencies()
  end

  defp select_words(sentence) do
    Regex.scan(~r/[[:alnum:]-]+/u, sentence)
  end
end
