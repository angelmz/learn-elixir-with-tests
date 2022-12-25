defmodule GreetingsTest do
  use ExUnit.Case

  test "hello/1 saying hello to people'" do
    assert Greetings.hello("Chris") == "Hello, Chris"
  end

  test "hello/1 empty string defaults to 'world'" do
    assert Greetings.hello("") == "Hello, World"
  end
end
