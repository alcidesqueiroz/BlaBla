module BlaBla
  class CartaoCredito
    #Apesar de que seria perfeitamente possível elaborar um algoritmo mais sofisticado,
    #que considere os códigos de cada banco, optei deliberadamente por não fazê-lo.  
    #Afinal, desconheço as questões legais sobre a geração automatizada de dados fictícios e 
    #não sei se a divulgação de tal código infringiria alguma lei.
    #Por essa razão, limitei-me a gerar números válidos e que considerem o código 
    #da bandeira apenas (3-> AMEX, 4-> Visa, 5-> MasterCard).
    #O uso indevido deste código não é de responsabilidade de seu autor.

    CODIGO_AMEX = 3
    CODIGO_VISA = 4
    CODIGO_MASTER = 5

    def self.numero params={}
      numeros = []
      numeros_verificacao = []

      unless params[:bandeira].nil?
        numeros << CODIGO_AMEX if params[:bandeira] == :amex
        numeros << CODIGO_VISA if params[:bandeira] == :visa
        numeros << CODIGO_MASTER if params[:bandeira] == :master
      else
        numeros << [CODIGO_AMEX, CODIGO_VISA, CODIGO_MASTER].sample
      end

      1.upto(16 - numeros.size) do
        numeros << rand(1..9)
      end

      total_pares = 0
      1.upto(16) do |p|
        if p % 2 == 0
          n = numeros[p-1]
          total_pares += n
        else
          n = numeros[p-1] * 2
          n -= 9 if n >= 10
        end
          
        numeros_verificacao << n
      end
      total = numeros_verificacao.inject(:+)
      resto = total % 10
      if resto > 0
        if resto <= 5
          subtrair = (total_pares > 5)
        else
          subtrair = (total_pares > 67)
          resto = 10 - resto unless subtrair
        end

        while resto > 0
          1.upto(16) do |p|
            if resto > 0
              if p % 2 == 0
                p -= 1
                numero = numeros[p]
                if subtrair
                  numeros[p] -= 1 if numeros[p] > 0
                else
                  numeros[p] += 1 if numeros[p] < 9
                end
                resto -= 1 if numero != numeros[p]
              end
            end
          end
        end
      end

      numeros.join
    end

    def self.formatado params={}
      numeros = numero(params).split ''
      [numeros[0..3], " ", numeros[4..7], " ", numeros[8..11], " ", numeros[12..15]].join
    end
  end
end