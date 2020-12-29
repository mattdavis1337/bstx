# ToyRobot

• PLACE will put the toy robot on the table in position X,Y and facing NORTH SOUTH, EAST
or WEST.
• The origin (0,0) is the SOUTH WEST most corner.
• All commands are ignored until a valid PLACE is made.
• MOVE will move the toy robot one unit forward in the direction it is currently facing.
• BACK will move the toy robot one unit backward, away from the direction it is currently facing.
• LEFT and RIGHT rotates the robot 90 degrees in the specified direction Iwithout changing
the position of the robot.
• REPORT announces the X,Y and F of the robot.


A 10 x 10 grid. 
A robot moves randomly around the grid. 
Each grid square can have a tile or card on it. 
There can be up to 5 players on a grid board. 
Each can move around freely. 
Only one player can occupy a particular square at a time. 
S









**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `toy_robot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:toy_robot, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/toy_robot](https://hexdocs.pm/toy_robot).

