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
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "computer"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "player"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response
    end
  end

  describe "update/1" do
    test "returns the game state updated" do
      player = Player.build("player", :chute, :soco, :cura)
      computer = Player.build("computer", :chute, :soco, :cura)

      Game.start(computer, player)

      expected_response = %{
        computer: %ExMonGame.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "computer"
        },
        player: %ExMonGame.Player{
          life: 100,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "player"
        },
        status: :started,
        turn: :player
      }

      assert Game.info() == expected_response

      new_state = %{
        computer: %ExMonGame.Player{
          life: 58,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "computer"
        },
        player: %ExMonGame.Player{
          life: 85,
          moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
          name: "player"
        },
        status: :started,
        turn: :player
      }

      Game.update(new_state)

      expected_response = %{new_state | turn: :computer, status: :continue}

      assert Game.info() == expected_response
    end
  end
end
