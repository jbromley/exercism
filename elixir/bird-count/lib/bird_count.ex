defmodule BirdCount do
  def today([]), do: nil
  def today([today | _rest]), do: today

  def increment_day_count([]), do: [1]
  def increment_day_count([today | rest]), do: [today + 1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([current | rest]), do: current == 0 or has_day_without_birds?(rest)

  def total([]), do: 0
  def total([current | rest]), do: current + total(rest)

  def busy_days([]), do: 0

  def busy_days([current | rest]) do
    busy = if current >= 5, do: 1, else: 0
    busy + busy_days(rest)
  end
end
