defmodule Challenges.MiniMiner do
  @moduledoc false

  def solve(
        %{
          "difficulty" => difficulty,
          "block" => %{
            "data" => data
          }
        }
      ) do

    find_nonce(:rand.uniform(1_000), data)
    |> IO.puts
  end

  def find_acceptable_start(difficulty) do
    "0"
  end

  defp find_nonce(nonce, data) do
    if validate(nonce, data) do
      nonce
    else
      find_nonce(:rand.uniform(1_000), data)
    end
  end

  defp validate(nonce, data) do
    try_nonce(nonce, data)
    |> String.starts_with?("00")

  end

  defp try_nonce(nonce, data) do
    %{"data" => data, "nonce" => nonce}
    |> Poison.encode!
    |> sha256
  end

  defp sha256(string) do
    :crypto.hash(:sha256, string)
    |> Base.encode16
    |> String.downcase
  end
end
