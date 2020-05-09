defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keep_aux(list, fun, [])
    |> Enum.reverse()
  end

  defp keep_aux([first | rest], fun, acc) do
    cond do
      fun.(first) ->
	keep_aux(rest, fun, [first | acc])
      true ->
	keep_aux(rest, fun, acc)
    end
  end
  defp keep_aux([], _fun, acc) do
    acc
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    discard_aux(list, fun , [])
    |> Enum.reverse()
  end

  defp discard_aux([first | rest], fun, acc) do
    cond do
      fun.(first) ->
	discard_aux(rest, fun, acc)
      true ->
	discard_aux(rest, fun, [first | acc])
    end
  end
  defp discard_aux([], _fun, acc) do
    acc
  end
end
