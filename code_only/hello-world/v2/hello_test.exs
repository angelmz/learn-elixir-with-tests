defmodule GreetingsTest do
  use ExUnit.Case

  test "hello/1 returns 'Hello, world'" do
    assert Greetings.hello("Chris") == "Hello, Chris"
  end
end
