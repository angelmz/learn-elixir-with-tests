defmodule GreetingsTest do
  use ExUnit.Case

  test "say hello world'" do
    assert Greetings.hello() == "Hello, world"
  end
end
