defmodule Day1 do
  def parse_file(filename) do
    {:ok, contents} = File.read(filename)

    contents
    |> String.split("\n")
    |> Enum.filter(fn el -> el != "" end)
    |> Enum.map(&String.to_integer/1)
  end

  def compare_measurement(el, acc) do
    with {prev, total_increases} <- acc do
      cond do
        el > prev -> {el, total_increases + 1}
        true -> {el, total_increases}
      end
    else
      _ -> {el, 0}
    end
  end

  def count_increases(measurements) do
    {_, total} = Enum.reduce(measurements, nil, &compare_measurement/2)
    total
  end

  def sum_chunk(chunk) do
    Enum.reduce(chunk, fn el, acc -> el + acc end)
  end

  def sum_by_chunks(measurements, chunk_size) do
    Enum.chunk_every(measurements, chunk_size, 1, :discard)
    |> Enum.map(&sum_chunk/1)
  end

  def part1() do
    parse_file("input.txt")
    |> count_increases
  end

  def part2() do
    parse_file("input.txt")
    |> sum_by_chunks(3)
    |> count_increases
  end
end
