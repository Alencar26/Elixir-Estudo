defmodule ExMonGame.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n========= The game is started! ============\n")
    IO.inspect(info)
    IO.puts("-------------------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n========= It's #{player} turn. ============\n")
    IO.inspect(info)
    IO.puts("-------------------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n========= The game is over. ============\n")
    IO.puts("

     _______ _            ______           _
    |__   __| |          |  ____|         | |
       | |  | |__   ___  | |__   _ __   __| |
       | |  | '_ \ / _ \ |  __| | '_ \ / _` |
       | |  | | | |  __/ | |____| | | | (_| |_
       |_|  |_| |_|\___| |______|_| |_|\__,_(_)

    ")
    IO.inspect(info)
    IO.puts("-------------------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n=========! Invalid move: #{move} !============\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n========= The Player attacked the computer dealing #{damage} damage. ============\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n========= The Computer attacked the player dealing #{damage} damage. ============\n")
  end
end
