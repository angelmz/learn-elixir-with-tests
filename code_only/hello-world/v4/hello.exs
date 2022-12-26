defmodule Greetings do
  def hello(name, :english), do: "Hello, " <> name_with_default(name)
  def hello(name, :spanish), do: "Hola, " <> name_with_default(name)
  def hello(name, :french), do: "Bonjour, " <> name_with_default(name)
  def hello(name, ""), do: "Hello, " <> name_with_default(name)

  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name
end
