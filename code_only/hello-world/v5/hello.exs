defmodule Greetings do
  def hello(name, language) do
    greetingPrefix(language) <> name_with_default(name)
  end

  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name

  defp greetingPrefix(language) do
    case language do
      "english" -> "Hello, "
      "spanish" -> "Hola, "
      "french" -> "Bonjour, "
      _ -> "Hello, "
    end
  end
end
