defmodule PhosphorIconsEx.MixProject do
  use Mix.Project

  @version "2.1.1"
  @github_url "https://github.com/dennym/phosphor_icons_ex"

  def project do
    [
      app: :phosphor_icons_ex,
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      source_url: @github_url
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:phoenix_html, "~> 4.0"},
      {:phoenix_live_view, "~> 1.0"},
      {:lazy_html, "~> 0.1"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:finch, "0.20.0", only: [:dev, :test], runtime: false}
    ]
  end

  defp docs do
    [
      main: "PhophorsIconsEx",
      source_ref: "v#{@version}",
      source_url: @github_url,
      groups_for_modules: [LiveView: ~r/PhosphorIconsEx.LiveView/],
      nest_modules_by_prefix: [PhosphorIconsEx.LiveView],
      extras: ["README.md"]
    ]
  end

  defp description do
    """
    This package adds a convenient way of using Phosphor 
    with your Phoenix and Phoenix LiveView applications.

    "Phosphor is a flexible icon family for interfaces, diagrams, presentations — whatever, really."
    """
  end

  defp package do
    %{
      files:
        ~w(lib/phosphor_icons_ex lib/phosphor_icons_ex.ex priv .formatter.exs mix.exs README.md LICENSE),
      licenses: ["BSD-3-Clause"],
      links: %{"GitHub" => @github_url}
    }
  end
end
