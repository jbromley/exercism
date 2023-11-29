defmodule ProteinTranslation do
  @codon_map %{
    "UGU" => "Cysteine",
    "UGC" => "Cysteine",
    "UUA" => "Leucine",
    "UUG" => "Leucine",
    "AUG" => "Methionine",
    "UUU" => "Phenylalanine",
    "UUC" => "Phenylalanine",
    "UCU" => "Serine",
    "UCC" => "Serine",
    "UCA" => "Serine",
    "UCG" => "Serine",
    "UGG" => "Tryptophan",
    "UAU" => "Tyrosine",
    "UAC" => "Tyrosine",
    "UAA" => "STOP",
    "UAG" => "STOP",
    "UGA" => "STOP"
  }

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {:ok, list(String.t())} | {:error, String.t()}
  def of_rna(rna) do
    codons = rna |> String.split("", trim: true) |> Enum.chunk_every(3) |> Enum.map(&Enum.join/1)
    of_rna(codons, [])
  end

  @spec of_rna(list(String.t()), list(String.t())) ::
          {:ok, list(String.t())} | {:error, String.t()}
  defp of_rna([], aminos) do
    {:ok, Enum.reverse(aminos)}
  end

  defp of_rna([codon | codons], aminos) do
    case of_codon(codon) do
      {:error, _} ->
        {:error, "invalid RNA"}

      {:ok, "STOP"} ->
        of_rna([], aminos)

      {:ok, amino} ->
        of_rna(codons, [amino | aminos])
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {:ok, String.t()} | {:error, String.t()}
  def of_codon(codon) do
    case Map.get(@codon_map, codon) do
      nil -> {:error, "invalid codon"}
      amino -> {:ok, amino}
    end
  end
end
