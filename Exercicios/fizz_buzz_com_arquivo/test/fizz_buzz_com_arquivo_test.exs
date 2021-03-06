defmodule FizzBuzzComArquivoTest do
  use ExUnit.Case

  describe "build/1" do
    test "when a valid file is provided, return the converted list" do
      expected_response =
        {:ok, [1, 2, :fizz, 4, :buzz, :fizz, 7, 8, :fizz, :buzz, :fizzbuzz, 19, :buzz, :fizz]}

      assert FizzBuzzComArquivo.build("numbers.txt") == expected_response
    end

    test "when an invalid file is provided, return an error" do
      expected_response = {:error, "Error reading the file: enoent"}
      assert FizzBuzzComArquivo.build("invalid.txt") == expected_response
    end
  end
end
