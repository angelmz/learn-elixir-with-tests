defmodule Greetings do
  @english_hello_prefix "Hello, "

  @spec hello(String.t()) :: String.t()
  def hello(name) do
    @english_hello_prefix <> name_with_default(name)
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello("world"))
  end

  @spec name_with_default(String.t()) :: String.t()
  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name
end
