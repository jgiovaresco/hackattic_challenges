defmodule HackatticChallenges.CLI do
  @moduledoc false

  @doc """

  """
  def main(args) do
    args
    |> HackatticChallenges.CLI.ArgumentsParser.parse_args
    |> process
  end

  def process([]) do
    IO.puts "Usage
      $ hackattic_challenges

    Options
      --challenge, -c  Select the challenge
      --file, -f  The file containing the challenge problem

    Examples
      $ hackattic_challenges -c mini_miner -f problem.json"
  end

  def process({:ok, %{challenge: challenge, file: file}}) do
    HackatticChallenges.process(%{challenge: challenge, file: file})
  end

end
