defmodule Greetings do
  @spec hello :: String.t()
  def hello do
    "Hello, world"
  end

  @spec say_hello :: void
  def say_hello do
    IO.puts(hello())
  end
end
