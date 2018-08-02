defmodule MixDeps.MixProject do
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()
  @elixir_version File.cwd!() |> Path.join(".elixir_version") |> File.read!() |> String.trim()
  @otp_version File.cwd!() |> Path.join(".otp_version") |> File.read!() |> String.trim()

  def get_version, do: @version
  def get_elixir_version, do: @elixir_version
  def get_otp_version, do: @otp_version

  def project do
    [
      app: :mix_deps,
      version: @version,
      elixir: @elixir_version,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # phoenix related dependencies
      {:phoenix, github: "tyrchen/phoenix", override: true},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},

      # Normal depedencies
      {:atomic_map, "~> 0.9.3"},
      {:absinthe, "~> 1.4.0"},
      {:absinthe_phoenix, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4.0"},
      {:bamboo, "~> 1.0"},
      {:bamboo_smtp, "~> 1.5.0"},
      {:con_cache, "~> 0.13.0"},
      {:cowboy, "~> 2.4.0"},
      {:cipher, "~> 1.4.0"},
      {:ecto, "~> 2.1"},
      {:ex_datadog_plug, "~> 0.5.0"},
      {:hackney, "~> 1.13.0", override: true},
      {:hexate, "~> 0.6.1"},
      {:httpoison, "~> 1.0"},
      {:kronky, "~> 0.5.0"},
      {:jason, "~> 1.0"},
      {:plug, "~> 1.6.0"},
      {:pot, "~> 0.9.7"},
      {:proper_case, "~> 1.2.0"},
      {:quantum, "~> 2.2"},
      {:recase, "~> 0.3.0"},
      {:timex, "~> 3.0"},
      {:sentry, "~> 6.4"},
      {:utility_belt, "> 0.0.0"},
      {:yaml_elixir, "~> 2.0.2"},

      # joken related
      {:joken, "~> 1.1"},
      {:libsodium, "> 0.0.0"},
      {:keccakf1600, "> 0.0.0"},

      # utility tools for error logs and metrics
      {:statix, ">= 0.0.0"},
      {:logger_sentry, "~> 0.1.5"},
      {:recon, "~> 2.3.2"},
      {:recon_ex, "~> 0.9.1"},

      # deployment
      {:distillery, "~> 1.5", runtime: false},

      # dev & test
      {:benchee, "~> 0.13.0", only: [:dev, :test]},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.18.0", only: [:dev, :test]},
      {:excheck, "~> 0.5", only: :test},
      {:pre_commit_hook, "~> 1.2", only: [:dev, :test]},
      {:triq, github: "triqng/triq", only: :test},

      # test only
      {:ex_machina, "~> 2.2", only: [:dev, :test]},
      {:faker, "~> 0.10", only: [:dev, :test]},
      {:mock, "~> 0.3.1", only: [:dev, :test]}
    ]
  end
end
