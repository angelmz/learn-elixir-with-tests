ExUnit.start()

defmodule GreetingsTest do
  use ExUnit.Case

  test "saying hello to people'" do
    assert Greetings.hello("Angel") == "Hello, Angel"
  end
end
