defmodule GreetingsTest do
  use ExUnit.Case, async: true

  describe "hello/2" do
    test "saying hello to people'" do
      assert Greetings.hello("Angel", "") == "Hello, Seth"
    end

    test "say hello world when an empty string is supplied" do
      assert Greetings.hello("", "") == "Hello, World"
    end

    test "say hello in French'" do
      assert Greetings.hello("Seth", "French") == "Bonjour, Seth"
    end

    test "say hello in Spanish" do
      assert Greetings.hello("Nathan", "Spanish") == "Hola, Seth"
    end
  end
end
