defmodule MixDeps.MixProject do
  use Mix.Project

  def project do
    [
      app: :mix_deps,
      version: "0.1.0",
      elixir: "~> 1.6",
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
      # Normal depedencies
      {:absinthe, "~> 1.4.0"},
      {:absinthe_plug, "~> 1.4.0"},
      {:bamboo, "~> 1.0"},
      {:bamboo_smtp, "~> 1.5.0"},
      {:con_cache, "~> 0.13.0"},
      {:cowboy, "~> 2.4.0"},
      {:cipher, "~> 1.4.0"},
      {:ecto, "~> 2.1"},
      {:ex_datadog_plug, "~> 0.5.0"},
      {:kronky, "~> 0.5.0"},
      {:jason, "~> 1.0"},
      {:plug, "~> 1.6.0"},
      {:proper_case, "~> 1.2.0"},
      {:postgrex, ">= 0.0.0"},
      {:recase, "~> 0.3.0"},
      {:sentry, "~> 6.4"},
      {:utility_belt, "> 0.0.0"},

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
      {:ex_doc, "~> 0.18", only: [:dev, :test]},
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