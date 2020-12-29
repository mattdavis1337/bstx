defmodule ToyRobot.Game.PlayerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.Game.Player
  alias ToyRobot.Robot
  alias ToyRobot.Table

  def build_table do
    %Table{
      north_boundary: 4,
      east_boundary: 4
    }
  end

  describe "report" do
    setup do
      starting_position = %{north: 0 , east: 0, facing: :north}
      {:ok, player} = Player.start(build_table(), starting_position)
      %{player: player}
    end

    test "shows the current position of the robot", %{player: player} do
      assert Player.report(player) == %Robot{
        north: 0,
        east: 0,
        facing: :north
      }
    end
  end


  describe "move" do
    setup do
      starting_position = %{north: 0, east: 0, facing: :north}
      {:ok, player} = Player.start(build_table(), starting_position)
      %{player: player}
    end

    test "moves the robot forward one space", %{player: player} do
      :ok = Player.move(player)
      assert Player.report(player) == %Robot{
        north: 1,
        east: 0,
        facing: :north
      }
    end
  end
end
