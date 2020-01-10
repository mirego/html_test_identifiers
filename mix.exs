defmodule HtmlTestIdentifiers.MixProject do
  use Mix.Project

  def project do
    [
      app: :html_test_identifiers,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # Linting
      {:credo, "~> 1.1", only: [:dev, :test], override: true},
      {:credo_naming, "~> 0.4", only: [:dev, :test], runtime: false}
    ]
  end
end
