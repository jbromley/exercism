defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    {_unit, volume} = volume_pair
    volume
  end

  def to_milliliter({unit, volume}) do
    factor =
      case unit do
        :milliliter -> 1
        :cup -> 240
        :fluid_ounce -> 30
        :teaspoon -> 5
        :tablespoon -> 15
      end

    {:milliliter, volume * factor}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    divisor =
      case unit do
        :milliliter -> 1.0
        :cup -> 240.0
        :fluid_ounce -> 30.0
        :teaspoon -> 5.0
        :tablespoon -> 15.0
      end

    {unit, volume / divisor}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter() |> from_milliliter(unit)
  end
end
