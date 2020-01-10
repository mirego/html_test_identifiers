[![Actions Status](https://github.com/mirego/html_test_identifiers/workflows/CI/badge.svg?branch%3Amaster)](https://github.com/mirego/html_test_identifiers/actions)

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

## Usages

```elixir
defmofule MyView do
  import HtmlTestIdentifiers
end
```

Considering `.eex` file content

```elixir
<h1 <%= testid_attribute("title-id") %>> Title </h1>
<%= content_tag :p, "paragraph text content", data_testid: testid_key("paragraph-id") %>
```

with `config :html_test_identifiers, provider: HtmlTestIdentifiers.TestID`, resulting HTML will be

```html
<h1 data-testid="title-id">Title</h1>
<p data-testid="paragraph-id">paragraph text content</p>
```

with `config :html_test_identifiers, provider: HtmlTestIdentifiers.NoTestID`, resulting HTML will be

```html
<h1>Title</h1>
<p>paragraph text content</p>
```

## Installation

The package can be installed by adding `html_test_identifiers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:html_test_identifiers, github: "mirego/html_test_identifiers", tag: "v0.1.0"}
  ]
end
```

## Contributors

- @romarickb

## License

`html_test_identifiers` is © 2019 [Mirego](https://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause). See the [`LICENSE.md`](https://github.com/mirego/html_test_identifiers/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](https://www.mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We’re a team of [talented people](https://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://www.mirego.org).

We also [love open-source software](https://open.mirego.com) and we try to give back to the community as much as we can.
