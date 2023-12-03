-module(raindrops).

-export([convert/1]).

convert(Number) ->
  S = raindrop(Number, 3, "Pling") ++ raindrop(Number, 5, "Plang") ++ raindrop(Number, 7, "Plong"),
  case S of
    "" -> integer_to_list(Number);
    _ -> S
  end.

raindrop(Number, Divisor, Sound) ->
  case Number rem Divisor of
    0 -> Sound;
    _ -> ""
  end.

