defmodule HighScore do
  @initial_score 0

  def new() do
    Map.new()
  end

  def add_player(scores, name, score \\ @initial_score) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.update(scores, name, @initial_score, fn _current -> @initial_score end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn current_score -> current_score + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
