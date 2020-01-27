defmodule HTMLTestIdentifiers.MixProject do
  use Mix.Project

  def project do
    [
      app: :html_test_identifiers,
      version: "0.1.1",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      source_url: "https://github.com/mirego/html_test_identifiers"
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
      {:credo_naming, "~> 0.4", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end

  defp description do
    "HTMLTestIdentifiers provides the basic functionality to add data-testid attribute depending on configuration"
  end

  defp package do
    [
      organization: "mirego",
      licences: ["BSD-3-Clause"],
      links: %{"GitHub" => "https://github.com/mirego/html_test_identifiers"}
    ]
  end
end
