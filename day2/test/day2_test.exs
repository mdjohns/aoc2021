defmodule Day2Test do
  use ExUnit.Case

  test "reads file" do
    assert(is_list(Day2.parse_file("test.txt")))
  end

  test "splits instruction into direction atom and amount" do
    assert(Day2.create_direction("forward 2") == {:forward, 2})
  end

  test "calculates final position" do
    instructions = Day2.parse_file("test.txt")
    assert(Day2.calculate_position(instructions) == {15, 10})
  end

  test "increases aim" do
    assert(Day2.apply_instruction({:down, 5}, {0, 0, 0}) === {0, 0, 5})
  end

  test "decreases aim" do
    assert(Day2.apply_instruction({:up, 3}, {0, 0, 5}) === {0, 0, 2})
  end

  test "increases horizontal position and depth" do
    assert(Day2.apply_instruction({:forward, 3}, {0, 2, 2}) === {3, 8, 2})
  end
end
