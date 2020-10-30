

#Algorítimo FizzBuzz em ELIXIR


# Definindo um modulo onde ficará as funções
defmodule FizzBuzz do
  # Definindo a função que receberá a quantidade de números por parâmetro
  def funcao(numero) do
    # Rodando um laço de repetição de 1..(até o número do parâmetro)
    # cada número é "jogado" para a variável "x"
    Enum.each(1..numero, fn x ->
      # Utilizando um case para fazer a validação
      # pegando o resto de divizão de 3 e 5 e "jogando" em uma Tuple
      case {rem(x, 3) == 0, rem(x,5) == 0} do
        # Validando a Tuple e retornando um print na tela
        {true, true} -> IO.puts "FizzBuzz"
        {false, true} -> IO.puts "Buzz"
        {true, false} -> IO.puts "Fizz"
        {false, false} -> IO.puts x
      end
    end)
  end
end
