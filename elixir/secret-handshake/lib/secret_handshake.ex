defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @command_map %{ 1 => "wink", 2 => "double blink", 4 => "close your eyes",
		  8 => "jump" }

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    bitval = 16
    reverse = (div(code, bitval) > 0)
    cond do
      code > 31 ->
	[]
      reverse == true ->
	commands_aux(code - bitval, div(bitval, 2), []) |> Enum.reverse()
      true ->
	commands_aux(code, div(bitval, 2), [])
    end
  end
  defp commands_aux(0, _bitval, cmd_list) do
    cmd_list
  end
  defp commands_aux(code, bitval, cmd_list) do
    if div(code, bitval) > 0 do
      commands_aux(code - bitval, div(bitval, 2),
	[@command_map[bitval] | cmd_list])
    else
      commands_aux(code, div(bitval, 2), cmd_list)
    end
  end
end
