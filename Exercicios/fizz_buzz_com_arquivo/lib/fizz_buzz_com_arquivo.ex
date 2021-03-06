defmodule FizzBuzzComArquivo do
  @doc """

  #usando switch case com pattern match

  def build(file_name) do
      case File.read(file_name) do
        {:ok, result} -> result
        {:error, reason} -> reason
      end
    end

  #usando só pattern match

  def build(file_name) do
    file = File.read(file_name)
    handle_file_read(file)
  end

  def handle_file_read({:ok, result}), do: result
  def handle_file_read({:error, reason}), do: reason


  #usando pipe operator pattern match

  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  def handle_file_read({:ok, result}), do: result
  def handle_file_read({:error, reason}), do: reason

  # três formas de fazer a mesma função:

    Enum.map(list, fn number -> String.to_integer(number) end)
    Enum.map(list, &String.to_integer/1)
    ou
    list
    |> Enum.map(&String.to_integer/1)


  """

  # usando pipe operator pattern match
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_read()
  end

  defp handle_file_read({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_read({:error, reason}), do: {:error, "Error reading the file: #{reason}"}

  defp convert_and_evaluate_numbers(element) do
    element
    |> String.to_integer()
    |> evaluate_numbers()
  end

  defp evaluate_numbers(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzbuzz
  defp evaluate_numbers(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_numbers(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_numbers(number), do: number
end
