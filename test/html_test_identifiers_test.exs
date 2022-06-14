defmodule HTMLTestIdentifiersTest do
  use ExUnit.Case

  import HTMLTestIdentifiersTest.Environment

  describe "TestID is configured" do
    setup do
      modify_env(:html_test_identifiers, provider: HTMLTestIdentifiers.TestID)
      :ok
    end

    test "testid_attribute/1" do
      assert HTMLTestIdentifiers.testid_attribute("hello") === %{"data-testid" => "hello"}
    end

    test "testid_key/1" do
      assert HTMLTestIdentifiers.testid_key("hello") === "hello"
    end
  end

  describe "NoTestID is configured" do
    setup do
      modify_env(:html_test_identifiers, provider: HTMLTestIdentifiers.NoTestID)
    end

    test "testid_attribute/1" do
      assert is_nil(HTMLTestIdentifiers.testid_attribute("hello"))
    end

    test "testid_key/1" do
      assert is_nil(HTMLTestIdentifiers.testid_key("hello"))
    end
  end
end
