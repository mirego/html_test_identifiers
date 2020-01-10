# HtmlTestIdentifiers

Provides the basic functionality to add `data-testid` attribute depending on configuration.

## Configuration

Add the following to your config files if you want `data-testid` included in your release :

```elixir
config :html_test_identifiers, provider: HtmlTestIdentifiers.TestID
```

Add the following to your config files if you don't want `data_testid` attribute to be included in your release :

```elixir
config :html_test_identifiers, provider: HtmlTestIdentifiers.NoTestID
```

If there is no configuration, `HtmlTestIdentifiers.NoTestID` will be used by default

## Examples

    with `config :html_test_identifiers, provider: HtmlTestIdentifiers.TestID`

    HtmlTestIdentifiers.testid_attribute("hello")
    # => "data-testid=\"hello\"

    HtmlTestIdentifiers.testid_key("hello")
    # => "hello"

    with `config :html_test_identifiers, provider: HtmlTestIdentifiers.NoTestID`

    HtmlTestIdentifiers.testid_attribute("hello")
    # => nil

    HtmlTestIdentifiers.testid_key("hello")
    # => nil

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `html_test_identifiers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:html_test_identifiers, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/html_test_identifiers](https://hexdocs.pm/html_test_identifiers).
