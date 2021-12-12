defmodule Day2 do
  def parse_file(path) do
    {:ok, contents} = File.read(path)

    contents
    |> String.split("\n", trim: true)
    |> Enum.map(&create_direction/1)
  end

  def create_direction(str) do
    [direction, amount] = String.split(str, " ")

    {String.to_atom(direction), String.to_integer(amount)}
  end

  # part 1
  def apply_instruction({:up, amount}, {x, y}), do: {x, y - amount}
  def apply_instruction({:down, amount}, {x, y}), do: {x, y + amount}
  def apply_instruction({:forward, amount}, {x, y}), do: {x + amount, y}

  # part 2
  def apply_instruction({:up, amount}, {x, y, aim}), do: {x, y, aim - amount}
  def apply_instruction({:down, amount}, {x, y, aim}), do: {x, y, aim + amount}
  def apply_instruction({:forward, amount}, {x, y, aim}), do: {x + amount, y + aim * amount, aim}

  # part 1
  def calculate_position(instructions) do
    Enum.reduce(instructions, {0, 0}, fn instruction, acc ->
      apply_instruction(instruction, acc)
    end)
  end

  # part 2
  def calculate_position_with_aim(instructions) do
    Enum.reduce(instructions, {0, 0, 0}, fn instruction, acc ->
      apply_instruction(instruction, acc)
    end)
  end
end
