defmodule HackatticChallenges.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hackattic_challenges,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      escript: escript(),
      deps: deps(),
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp escript do
    [
      main_module: HackatticChallenges.CLI,
      path: "./bin/hackattic_challenge"
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false}
    ]
  end
end
