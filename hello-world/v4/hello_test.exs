ExUnit.start()

defmodule GreetingsTest do
  use ExUnit.Case

  describe "hello/1" do
    test "saying hello to people'" do
      assert Greetings.hello("Angel") == "Hello, Angel"
    end

    test "empty string defaults to 'world'" do
      assert Greetings.hello("") == "Hello, World"
    end
  end
end
