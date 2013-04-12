#encoding: UTF-8
module BlaBla
  class ISBN
    # Gera um número válido de ISBN
    # @return [String] o número de ISBN
    def self.numero
      numeros = [9, 7, 8]

      1.upto(9) do
        numeros << rand(0..9)
      end

      soma = numeros[0]
      1.upto(11) do |n|
        soma += numeros[n] * (n % 2 == 0 ? 1 : 3)
      end
      
      modulo = soma % 10 

      dv = 0
      dv = 10 - modulo if(modulo != 0)

      numeros << dv

      numeros.join 
    end

    # Gera um número válido de ISBN no formato ###-###-##-####-#
    # @return [String] o número de ISBN formatado
    def self.formatado
      numeros = numero.split ''
      [numeros[0..2], "-", numeros[3..5], "-", numeros[6..7], "-", numeros[8..11], "-", numeros[12]].join
    end
  end
end