defmodule Greetings do
  @english_hello_prefix "Hello, "
  @spanish_hello_prefix "Hola, "
  @french_hello_prefix "Bonjur, "

  @spec hello(String.t(), String.t()) :: String.t()
  def hello(name, language) do

      prefix =
          case language do
              "spanish" -> @spanish_hello_prefix
              "french" -> @french_hello_prefix
              _ -> @english_hello_prefix
          end

      prefix <> name_with_default(name)
  end

  @spec say_hello :: :ok
  def say_hello do
    IO.puts(hello("world", ""))
  end

  @spec name_with_default(String.t()) :: String.t()
  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name
end
