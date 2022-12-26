defmodule Greetings do
  def hello(name) do
    "Hello, " <> name_with_default(name)
  end

  defp name_with_default(""), do: "World"
  defp name_with_default(name), do: name
end
