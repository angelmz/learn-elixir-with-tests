defmodule IntegersTest do
  use ExUnit.Case
  import D

  test "add/2 returns the sum of two integers" do
    assert Integers.add(1, 2) == 3
  end
end
