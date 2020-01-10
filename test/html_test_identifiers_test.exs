defmodule HtmlTestIdentifiersTest do
  use ExUnit.Case

  import HtmlTestIdentifiersTest.Environment

  describe "TestID is configured" do
    setup do
      modify_env(:html_test_identifiers, provider: HtmlTestIdentifiers.TestID)
      :ok
    end

    test "testid_attribute/1" do
      assert HtmlTestIdentifiers.testid_attribute("hello") === {:safe, "data-testid=\"hello\""}
    end

    test "testid_key/1" do
      assert HtmlTestIdentifiers.testid_key("hello") === "hello"
    end
  end

  describe "NoTestID is configured" do
    setup do
      modify_env(:html_test_identifiers, provider: HtmlTestIdentifiers.NoTestID)
    end

    test "testid_attribute/1" do
      assert is_nil(HtmlTestIdentifiers.testid_attribute("hello"))
    end

    test "testid_key/1" do
      assert is_nil(HtmlTestIdentifiers.testid_key("hello"))
    end
  end
end
