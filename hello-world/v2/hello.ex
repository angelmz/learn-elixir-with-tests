defmodule Greetings do
  @spec hello(String.t()) :: String.t()
  def hello(name) do
    "Hello, " <> name
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello("world"))
  end
end
