defmodule IntegersTest do
  use ExUnit.Case, async: true

  test "adder/2 returns the sum of two integers" do
    assert Integers.adder(1, 2) == 3
  end
end
