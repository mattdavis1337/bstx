defmodule ToyRobot.Game.ServerTest do
  use ExUnit.Case, async: true

  alias ToyRobot.Game.Server

  setup do
    {:ok, game} = Server.start_link([north_boundary: 4, east_boundary: 4])
    {:ok, %{game: game}}
  end

  test "can place a player", %{game: game} do
    :ok = Server.place(game, %{north: 0, east: 0, facing: :north}, "Rosie")
    assert Server.player_count(game) == 1
  end
end
