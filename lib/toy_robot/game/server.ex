defmodule ToyRobot.Game.Server do
  use GenServer

  alias ToyRobot.Table
  alias ToyRobot.Game.PlayerSupervisor

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init([north_boundary: north_boundary, east_boundary: east_boundary]) do
    uuid = Integer.to_string(:rand.uniform(4294967296), 32) <> Integer.to_string(:rand.uniform(4294967296), 32)
    registry_id = "game-#{uuid}" |> String.to_atom

    Registry.start_link(keys: :unique, name: registry_id)

    {:ok, %{
      registry_id: registry_id,
      table: %Table{
        north_boundary: north_boundary,
        east_boundary: east_boundary
      }
    }}
  end

  def place(game, position, name) do
    GenServer.call(game, {:place, position, name})
  end

  def player_count(game) do
    GenServer.call(game, :player_count)
  end

  def handle_call(
      {:place, position, name},
      _from,
      %{registry_id: registry_id, table: table} = state
      ) do
    {:ok, _player} = PlayerSupervisor.start_child(registry_id, table, position, name)
    {:reply, :ok, state}
  end

  def handle_call(:player_count, _from, %{registry_id: registry_id} = state) do
    {:reply, Registry.count(registry_id), state}
  end
end
