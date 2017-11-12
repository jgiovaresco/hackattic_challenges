defmodule HackatticChallenges.CLI.ArgumentsParser do
  @moduledoc false

  def parse_args(args) do
    OptionParser.parse(
      args,
      switches: [
        challenge: :string,
        file: :string
      ],
      aliases: [
        c: :challenge,
        f: :file
      ]
    )
    |> extract_param
  end

  defp extract_param({options, _, _}) do
    params = %{challenge: options[:challenge], file: options[:file]}

    case params do
      %{challenge: nil, file: nil} ->
        {:error, ["challenge not provided", "file not provided"]}
      %{challenge: nil} ->
        {:error, ["challenge not provided"]}
      %{file: nil} ->
        {:error, ["file not provided"]}
      _ ->
        {:ok, params}
    end
  end
end
