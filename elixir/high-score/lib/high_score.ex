defmodule HighScore do
  def new() do
    Map.new()
  end

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    {_, new_scores} = Map.get_and_update(scores, name, fn current -> {current, 0} end)
    new_scores
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn current_score -> current_score + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
