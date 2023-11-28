defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    [_ | other_langs] = list
    other_langs
  end

  def first(list) do
    [first_lang | _other_langs] = list
    first_lang
  end

  def count(list) do
    Enum.count(list)
  end

  def functional_list?(list) do
    Enum.any?(list, fn lang -> lang == "Elixir" end)
  end
end
