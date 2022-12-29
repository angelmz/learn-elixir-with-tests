defmodule Greetings do
  @english_hello_prefix "Hello, "

  @spec hello(String.t()) :: String.t()
  def hello(name) do
    @english_hello_prefix <> name
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello("world"))
  end
end
