defmodule GreetingsTest do
  use ExUnit.Case

  test "saying hello to people'" do
    assert Greetings.hello("Chris") == "Hello, Chris"
  end
end
