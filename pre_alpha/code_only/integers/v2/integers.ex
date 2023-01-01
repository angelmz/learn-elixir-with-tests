defmodule Integers do
  @moduledoc """
  This module provides functions for adding integers.
  Example:
      iex> Integers.add(1, 2)
      3
  """

  @doc """
  Returns the sum of two integers.

  ## Parameters

    - x: The first integer.
    - y: The second integer.

  ## Examples

      iex> Integers.add(1, 2)
      3
  """

  @spec add(integer, integer) :: integer
  def add(x, y) do
    return x + y
  end
end
