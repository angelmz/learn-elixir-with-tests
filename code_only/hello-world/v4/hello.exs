defmodule Greetings do
  def hello(name, "English"), do: "Hello, " <> name_with_default(name)
  def hello(name, "Spanish"), do: "Hola, " <> name_with_default(name)
  def hello(name, "French"), do: "Bonjour, " <> name_with_default(name)
  def hello(name, ""), do: "Hello, " <> name_with_default(name)

  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name

  # Option 2
  # def hello(name, language) do
  #   name = name_with_default(name)
  #   prefix = prefix_for(language)
  #   prefix <> name
  # end

  # defp name_with_default(""), do: "World"
  # defp name_with_default(name), do: name

  # defp prefix_for(:english), do: "Hello, "
  # defp prefix_for(:spanish), do: "Hola, "
  # defp prefix_for(:french), do: "Bonjour, "
  # defp prefix_for(""), do: "Hello, "
end
