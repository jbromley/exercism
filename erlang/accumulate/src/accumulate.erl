-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, [H | T], Result) ->
  accumulate(Fn, T, [Fn(H) | Result]);
accumulate(_Fn, [], Result) ->
  lists:reverse(Result).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), [A]) -> [B].
accumulate(Fn, List) ->
  accumulate(Fn, List, []).
