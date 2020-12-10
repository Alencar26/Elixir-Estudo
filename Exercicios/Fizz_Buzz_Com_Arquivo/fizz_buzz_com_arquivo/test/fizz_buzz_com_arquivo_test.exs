defmodule FizzBuzzComArquivoTest do
  use ExUnit.Case
  doctest FizzBuzzComArquivo

  test "greets the world" do
    assert FizzBuzzComArquivo.hello() == :world
  end
end
