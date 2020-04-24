defmodule RnaTranscription do
  @dna_rna_map %{?A => ?U,
  		 ?C => ?G,
  		 ?G => ?C,
  		 ?T => ?A}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(fn (n) -> @dna_rna_map[n] end)
  end
end
