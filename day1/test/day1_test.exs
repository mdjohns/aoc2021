defmodule Day1Test do
  use ExUnit.Case

  test "parses file to list of integers" do
    assert(is_list(Day1.parse_file("test.txt")))
  end

  test "counts number of increases" do
    measurements = Day1.parse_file("test.txt")
    assert(Day1.count_increases(measurements) == 7)
  end

  test "sum measurements in groups of three" do
    measurements = Day1.parse_file("test.txt")
    correct_sums = Day1.parse_file("sums.txt")
    actual_sums = Day1.sum_by_chunks(measurements, 3)

    assert(actual_sums == correct_sums)
  end

  test "counts number of increases from sums" do
    sums = Day1.parse_file("sums.txt")

    assert(Day1.count_increases(sums) == 5)
  end
end
