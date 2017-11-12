defmodule Challenges.MiniMinerTest do
  use ExUnit.Case
  doctest Challenges.MiniMiner
  import Challenges.MiniMiner

  describe "find_acceptable_start" do
    test "return '0' for a 0 difficulty" do
      assert find_acceptable_start(0) === "0"
    end
  end
end
