defmodule HtmlTestIdentifiers do
  @moduledoc """
  Provides the basic functionality to add `data-testid` attribute depending on configuration.

  ## Configuration
  Add the following to your config files if you want `data-testid` included in your release :
      config :html_test_identifiers, provider: HtmlTestIdentifiers.TestID

  Add the following to your config files if you don't want `data_testid` attribute to be included in your release :
      config :html_test_identifiers, provider: HtmlTestIdentifiers.NoTestID

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

  """
  def testid_attribute(key), do: data_identifier_provider().testid_attribute(key)

  def testid_key(key), do: data_identifier_provider().testid_key(key)

  defp data_identifier_provider do
    case Application.fetch_env(:html_test_identifiers, :provider) do
      {:ok, value} ->
        value

      :error ->
        HtmlTestIdentifiers.NoTestID
    end
  end
end
