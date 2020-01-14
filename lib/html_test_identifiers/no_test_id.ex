defmodule HTMLTestIdentifiers.NoTestID do
  @moduledoc """
    All functions return nil
  """

  def testid_attribute(_), do: nil
  def testid_key(_), do: nil
end
