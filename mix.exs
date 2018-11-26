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
      # aws related
      {:ex_aws, "~> 2.0"},
      {:ex_aws_kinesis, "~> 2.0"},
      {:ex_aws_s3, "~> 2.0"},

      # phoenix related dependencies
      {:phoenix, "~> 1.4"},
      {:phoenix_ecto, "~> 4.0"},
      {:phoenix_html, "~> 2.12"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_pubsub, "~> 1.1"},
      {:postgrex, "~> 0.14"},
      {:gettext, "~> 0.16"},

      # comeonin related
      {:comeonin, "~> 4.1"},
      {:argon2_elixir, "~> 1.3"},
      {:bcrypt_elixir, "~> 1.1"},

      # Normal depedencies
      {:atomic_map, "~> 0.9.3"},
      {:absinthe, "~> 1.4.0"},
      {:absinthe_phoenix, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4.0"},
      {:bamboo, "~> 1.1"},
      {:bamboo_smtp, "~> 1.6"},
      {:con_cache, "~> 0.13.0"},
      {:cors_plug, "~> 2.0"},
      {:cowboy, "~> 2.6"},
      {:cipher, "~> 1.4"},
      {:ecto, "~> 3.0"},
      {:ecto_sql, "~> 3.0"},
      {:ex_datadog_plug, "~> 0.5.0"},
      {:hackney, "~> 1.14"},
      {:hexate, "~> 0.6.1"},
      {:httpoison, "~> 1.0"},
      {:jason, "~> 1.0"},
      {:joken, "~> 1.5"},
      {:kronky, "~> 0.5.0"},
      {:not_qwerty123, "~> 2.3"},
      {:plug, "~> 1.7"},
      {:pot, "~> 0.9.7"},
      {:proper_case, "~> 1.2.0"},
      {:quantum, "~> 2.2.7"},
      {:recase, "~> 0.3.0"},
      {:sentry, "~> 7.0"},
      {:tesla, "~> 1.0.0"},
      {:timex, "~> 3.0"},
      {:yaml_elixir, "~> 2.1"},

      # utility tools for error logs and metrics
      {:statix, ">= 0.0.0"},
      {:logger_sentry, "~> 0.2"},
      {:recon, "~> 2.3.2"},
      {:recon_ex, "~> 0.9.1"},

      # deployment
      {:distillery, "~> 2.0", runtime: false},

      # dev & test
      {:benchee, "~> 0.13.0", only: [:dev, :test]},
      {:coveralls, "~> 1.5", only: :test},
      {:credo, "~> 1.0", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: [:dev, :test]},
      {:ex_machina, "~> 2.2", only: [:dev, :test]},
      {:excheck, "~> 0.5", only: :test},
      {:faker, "~> 0.11", only: [:dev, :test]},
      {:mock, "~> 0.3", only: [:dev, :test]},
      {:pre_commit_hook, "~> 1.2", only: [:dev, :test]},
      {:triq, "~> 1.3", only: :test}
    ]
  end
end
