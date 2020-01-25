[![](https://github.com/mirego/html_test_identifiers/workflows/CI/badge.svg?branch%3Amaster)](https://github.com/mirego/html_test_identifiers/actions)

# HTMLTestIdentifiers

Provides the basic functionality to add `data-testid` attribute depending on configuration.

## Installation

The package can be installed by adding `html_test_identifiers` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:html_test_identifiers, github: "mirego/html_test_identifiers", tag: "v0.1.1"}
  ]
end
```

## Configuration

Add the following to your config files if you want `data-testid` included in your release :

```elixir
config :html_test_identifiers, provider: HTMLTestIdentifiers.TestID
```

Add the following to your config files if you don't want `data_testid` attribute to be included in your release :

```elixir
config :html_test_identifiers, provider: HTMLTestIdentifiers.NoTestID
```

If there is no configuration, `HTMLTestIdentifiers.NoTestID` will be used by default

## Usage

```elixir
# With `config :html_test_identifiers, provider: HTMLTestIdentifiers.TestID`

HTMLTestIdentifiers.testid_attribute("hello")
# => "data-testid=\"hello\"

HTMLTestIdentifiers.testid_key("hello")
# => "hello"

# With `config :html_test_identifiers, provider: HTMLTestIdentifiers.NoTestID`

HTMLTestIdentifiers.testid_attribute("hello")
# => nil

HTMLTestIdentifiers.testid_key("hello")
# => nil
```

You can also import the module in a view helpers module:

```elixir
defmodule MyView do
  import HTMLTestIdentifiers
end
```

Considering `.eex` file content

```elixir
<h1 <%= testid_attribute("title-id") %>>Title</h1>
<%= content_tag :p, "paragraph text content", data_testid: testid_key("paragraph-id") %>
```

with `config :html_test_identifiers, provider: HTMLTestIdentifiers.TestID`, resulting HTML will be

```html
<h1 data-testid="title-id">Title</h1>
<p data-testid="paragraph-id">paragraph text content</p>
```

with `config :html_test_identifiers, provider: HTMLTestIdentifiers.NoTestID`, resulting HTML will be

```html
<h1>Title</h1>
<p>paragraph text content</p>
```

## Contributors

- @romarickb

## License

`html_test_identifiers` is © 2019 [Mirego](https://www.mirego.com) and may be freely distributed under the [New BSD license](http://opensource.org/licenses/BSD-3-Clause). See the [`LICENSE.md`](https://github.com/mirego/html_test_identifiers/blob/master/LICENSE.md) file.

## About Mirego

[Mirego](https://www.mirego.com) is a team of passionate people who believe that work is a place where you can innovate and have fun. We’re a team of [talented people](https://life.mirego.com) who imagine and build beautiful Web and mobile applications. We come together to share ideas and [change the world](http://www.mirego.org).

We also [love open-source software](https://open.mirego.com) and we try to give back to the community as much as we can.
