defmodule GreetingsTest do
  use ExUnit.Case

  test "hello/2 returns 'Hello, <name>'" do
    assert Greetings.hello("Seth", "") == "Hello, Seth"
  end

  test "hello/2 returns 'Hello, World' when name is empty" do
    assert Greetings.hello("", "") == "Hello, World"
  end

  test "hello/2 returns 'Bonjour, <name>'" do
    assert Greetings.hello("Seth", "French") == "Bonjour, Seth"
  end

  test "hello/2 returns 'Hola, <name>'" do
    assert Greetings.hello("Seth", "Spanish") == "Hola, Seth"
  end
end
