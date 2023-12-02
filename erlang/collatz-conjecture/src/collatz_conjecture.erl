-module(collatz_conjecture).

-export([steps/1]).

steps(N) when is_integer(N), N > 0 -> steps(N, 0);
steps(_) -> error(badarg).

steps(1, Result) -> Result;
steps(N, Result) when N rem 2 == 0 -> steps(N div 2, Result + 1);
steps(N, Result) -> steps(3 * N + 1, Result + 1).

