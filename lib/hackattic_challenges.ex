defmodule HackatticChallenges do
  @moduledoc """
  Documentation for HackatticChallenges.
  """

  def process(%{challenge: "mini_miner", file: json}) do
    json
    |> File.read!
    |> Poison.Parser.parse!
    |> Challenges.MiniMiner.solve
  end

  def process(%{challenge: challenge}) do
    IO.puts "Unknown challenge : #{challenge}"
  end
end
