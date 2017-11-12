defmodule HackatticChallenges.CLI.ArgumentsParserTest do
  use ExUnit.Case
  doctest HackatticChallenges.CLI.ArgumentsParser
  import HackatticChallenges.CLI.ArgumentsParser

  describe "parse_args" do
    test "returns missing parameters when no arguments" do
      assert parse_args([]) == {
               :error,
               ["challenge not provided", "file not provided"]
             }
    end

    test "returns missing parameters" do
      assert parse_args(["--unknown", "unknown"]) == {
               :error,
               ["challenge not provided", "file not provided"]
             }
    end

    test "returns missing parameters when a parameter is missing" do
      assert parse_args(["--file", "problem.json"]) == {
               :error,
               ["challenge not provided"]
             }
      assert parse_args(["--challenge", "mini_miner"]) == {
               :error,
               ["file not provided"]
             }
    end

    test "returns the challenge and the file" do
      assert parse_args(["--file", "problem.json", "--challenge", "mini_miner"]) == {
               :ok,
              %{challenge: "mini_miner", file: "problem.json"}
             }
    end
  end
end
