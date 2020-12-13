defmodule ExMonGame do
  alias ExMonGame.Player
  #alias ExMonGame.Player, as: CriaPlayer (poderia ser só assim)

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_avg, move_rnd, move_heal)
  end
end
