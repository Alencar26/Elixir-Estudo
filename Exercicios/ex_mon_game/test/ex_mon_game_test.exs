defmodule ExMonGameTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  alias ExMonGame.Player


  describe "create_player/4" do
    test "return a player" do
      expected_response = %Player{
        life: 100,
        moves: %{move_avg: :chute, move_heal: :cura, move_rnd: :soco},
        name: "player"
      }

      assert expected_response == ExMonGame.create_player("player", :chute, :soco, :cura)
    end
  end

  describe "start_game/1" do
    test "when the game is started, returns a message" do

      player = Player.build("player", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMonGame.start_game(player) == :ok
      end)

      assert messages =~ "The game is started!"
      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe "make_move/1" do

    setup do
      player = Player.build("player", :chute, :soco, :cura)

        capture_io(fn ->
          ExMonGame.start_game(player)
      end)

      :ok
    end
    test "when the move is valid, do the move and the computer makes a move" do

      player = Player.build("player", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          ExMonGame.make_move(:chute)
      end)

      assert messages =~ "The Player attacked the computer"
      assert messages =~ "status: :continue"
      assert messages =~ "turn: :computer"
      assert messages =~ "The Computer attacked the player"
      assert messages =~ "status: :continue"
      assert messages =~ "turn: :player"
    end

    test "when the move is invalid, return an error message" do

      messages =
        capture_io(fn ->
          ExMonGame.make_move(:wrong)
      end)

      assert messages =~ "Invalid move: wrong"

    end
  end
end
