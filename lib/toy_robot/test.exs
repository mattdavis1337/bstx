alias ToyRobot.Robot
%Robot{east: 0, north: 0, facing: :north}
|> Robot.move
|> Robot.turn_right
|> Robot.move
|> Robot.turn_left
|> IO.inspect
|> Robot.move
|> Robot.move
|> Robot.turn_left
|> Robot.move
|> Robot.turn_right
|> Robot.turn_right
|> Robot.move
|> Robot.move
|> Robot.move
|> IO.inspect