defmodule WannabeBool.MixProject do
  use Mix.Project

  @app :wannabe_bool
  @name "Wannabe Bool"
  @repo "https://github.com/prodis/wannabe_bool_elixir"
  @version "0.1.3"

  def project do
    [
      app: @app,
      name: @name,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      description: description(),
      docs: docs(),
      package: package(),
      preferred_cli_env: preferred_cli_env(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application, do: []

  defp deps do
    [
      # Development
      {:credo, "~> 1.5", only: :dev, runtime: false},
      {:dialyxir, "~> 1.1.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.25", only: :dev, runtime: false},

      # Test
      {:excoveralls, "~> 0.14", only: :test}
    ]
  end

  defp description do
    """
    If Atom, BitString, Integer and Float values wanna be a boolean value, they can using to_boolean/1 function.
    """
  end

  defp dialyzer do
    [
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: ~w(README.md CHANGELOG.md),
      formatters: ~w(html),
      source_ref: @version,
      source_url: @repo,
      canonical: "http://hexdocs.pm/wannabe_bool"
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md CHANGELOG.md LICENSE),
      maintainers: ["Fernando Hamasaki de Amorim"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @repo}
    ]
  end

  defp preferred_cli_env do
    [
      coveralls: :test,
      "coveralls.detail": :test,
      "coveralls.post": :test,
      "coveralls.html": :test,
      "coveralls.travis": :test
    ]
  end
end
