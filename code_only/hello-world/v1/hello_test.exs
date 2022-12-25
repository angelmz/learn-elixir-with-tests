defmodule GreetingsTest do
  use ExUnit.Case

  test "hello/0 returns 'Hello, world'" do
    assert Greetings.hello() == "Hello, world"
  end
end
