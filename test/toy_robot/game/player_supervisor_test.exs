defmodule ToyRobot.Game.PlayerSupervisorTest do
  use ExUnit.Case, async: true

  alias ToyRobot.{Game.PlayerSupervisor, Table}

  setup do
    :rand.seed(:exs1024, {123, 123534, 345345})
    uuid = Integer.to_string(:rand.uniform(4294967296), 32) <> Integer.to_string(:rand.uniform(4294967296), 32)
    registry_id = "play-sup-test-#{uuid}" |> String.to_atom

    Registry.start_link(keys: :unique, name: registry_id)

    starting_position = %{north: 0, east: 0, facing: :north}
    player_name = "Izzy"

    {:ok, _player} =
      PlayerSupervisor.start_child(
        registry_id,
        build_table(),
        starting_position,
        player_name
      )

    [{_registered_player, _}] =
      Registry.lookup(
        registry_id,
        player_name
      )
    IO.puts("setup")
    IO.puts(registry_id)


    {:ok, %{registry_id: registry_id, player_name: player_name}}
  end

  def build_table do
    %Table{
      north_boundary: 4,
      east_boundary: 4
    }
  end

  test "moves a robot forward", %{registry_id: registry_id, player_name: player_name} do
    IO.puts("move")
    IO.puts(registry_id)

    :ok = PlayerSupervisor.move(
      registry_id, player_name
    )


    %{north: north} = PlayerSupervisor.report(registry_id, player_name)

    assert north == 1
  end

  test "reports a robot's location", %{registry_id: registry_id, player_name: player_name} do
    IO.puts("report")
    IO.puts(registry_id)

    %{north: north} = PlayerSupervisor.report(registry_id, player_name)

    assert north == 0
  end
end
