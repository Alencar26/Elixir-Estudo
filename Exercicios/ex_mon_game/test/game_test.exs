defmodule ExMonGame.GameTest do
  use ExUnit.Case

  alias ExMonGame.{Player, Game}

  describe "start/2" do
    test "starts the game state" do
      player = Player.build("player", :chute, :soco, :cura)
      computer = Player.build("computer", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(computer, player)
    end
  end

  describe "info/0" do
    test "return the current game state" do
      player = Player.build("player", :chute, :soco, :cura)
      computer = Player.build("computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMonGame.Player{
          life: 100,
          moves: %{move_avg: :chute,move_heal: :cura,move_rnd: :soco},
          name: "computer"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{move_avg: :chute,move_heal: :cura,move_rnd: :soco},
          name: "player"
        },
        status: :started,
        turn: :player}

      assert Game.info() ==  expected_response
    end
  end

  describe "update/1" do
    test "return the game state updated" do
      #ESTOU AQUI 08:19MIN DO VÍDEO
    end
  end
end
