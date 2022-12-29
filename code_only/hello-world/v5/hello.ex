defmodule Greetings do
  @english_hello_prefix "Hello, "
  @spanish_hello_prefix "Hola, "
  @french_hello_prefix "Bonjour, "

  @spec hello(String.t(), String.t()) :: String.t()
  def hello(name, language) do
      language_prefix(language) <> name_with_default(name)
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello("world", ""))
  end

  @spec name_with_default(String.t()) :: String.t()
  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name

  @spec language_prefix(String.t()) :: String.t()
  defp language_prefix(:spanish), do: @spanish_hello_prefix
  defp language_prefix(:french), do: @french_hello_prefix
  defp language_prefix(""), do: @english_hello_prefix
end
