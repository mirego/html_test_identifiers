defmodule HtmlTestIdentifiers.TestID do
  @moduledoc """
    Functions which returns key or attribute with key
  """

  def testid_attribute(key) do
    ~s(data-testid="#{key}")
  end

  def testid_key(key), do: key
end
