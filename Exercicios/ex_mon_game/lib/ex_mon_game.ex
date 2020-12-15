defmodule ExMonGame do
  alias ExMonGame.{Game, Player}
  alias ExMonGame.Game.{Status, Actions}
  #alias ExMonGame.Game
  #alias ExMonGame.Player
  #alias ExMonGame.Player, as: CriaPlayer (poderia ser assim também)

  @computer_name "Robozito"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:soco, :chute, :cura)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    Actions.fetch_move(move)
  end
end
