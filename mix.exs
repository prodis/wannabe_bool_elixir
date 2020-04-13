defmodule WannabeBool.MixProject do
  use Mix.Project

  @version "0.1.0"
  @github_url "https://github.com/prodis/wannabe_bool_elixir"

  def project do
    [
      app: :wannabe_bool,
      name: "Wannabe Bool",
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      description: description(),
      package: package(),
      docs: docs(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Development
      {:credo, "~> 1.3", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0", only: :dev, runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},

      # Test
      {:excoveralls, "~> 0.12", only: :test}
    ]
  end

  defp description do
    """
    If Atom, BitString, Integer and Float values wanna be a boolean value, they can using to_boolean/1 function.
    """
  end

  defp dialyzer do
    [
      ignore_warnings: "dialyzer.ignore"
    ]
  end

  defp package do
    [
      maintainers: ["Fernando Hamasaki de Amorim"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => @github_url}
    ]
  end

  defp docs() do
    [
      main: "readme",
      extras: ["README.md", "CHANGELOG.md"],
      source_ref: @version,
      source_url: @github_url,
      canonical: "http://hexdocs.pm/wannabe_bool"
    ]
  end
end
