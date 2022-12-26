defmodule GreetingsTest do
  use ExUnit.Case, async: true

  test "hello/2 saying hello in English" do
    assert Greetings.hello("Lauren", :english) == "Hello, Lauren"
  end

  test "hello/2 saying hello in Spanish" do
    assert Greetings.hello("Elodie", :spanish) == "Hola, Elodie"
  end

  test "hello/2 saying hello in French" do
    assert Greetings.hello("Lauren", :french) == "Bonjour, Lauren"
  end

  test "hello/1 saying hello to people'" do
    assert Greetings.hello("Chris", "") == "Hello, Chris"
  end

  test "hello/1 empty string defaults to 'World'" do
    assert Greetings.hello("", "") == "Hello, World"
  end
end


  # func TestHello(t *testing.T) {
  #   t.Run("to a person", func(t *testing.T) {
  #     got := Hello("Chris", "")
  #     want := "Hello, Chris"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("empty string", func(t *testing.T) {
  #     got := Hello("", "")
  #     want := "Hello, World"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("in Spanish", func(t *testing.T) {
  #     got := Hello("Elodie", spanish)
  #     want := "Hola, Elodie"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("in French", func(t *testing.T) {
  #     got := Hello("Lauren", french)
  #     want := "Bonjour, Lauren"
  #     assertCorrectMessage(t, got, want)
  #   })

  # }


  # func TestHello(t *testing.T) {
  #   t.Run("to a person", func(t *testing.T) {
  #     got := Hello("Chris", "")
  #     want := "Hello, Chris"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("empty string", func(t *testing.T) {
  #     got := Hello("", "")
  #     want := "Hello, World"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("in Spanish", func(t *testing.T) {
  #     got := Hello("Elodie", spanish)
  #     want := "Hola, Elodie"
  #     assertCorrectMessage(t, got, want)
  #   })

  #   t.Run("in French", func(t *testing.T) {
  #     got := Hello("Lauren", french)
  #     want := "Bonjour, Lauren"
  #     assertCorrectMessage(t, got, want)
  #   })

  # }
