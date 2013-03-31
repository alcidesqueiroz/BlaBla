module BlaBla
  class CPF
    def self.numero
      numeros = []

      1.upto(9) do
        numeros << rand(0..9)
      end

      d1 = 0
      
      8.downto(0) do |n|
        d1 += numeros[n] * (10 - (n))
      end
      
      d1 = 11 - (d1 % 11)
      d1 = 0 if d1 >= 10

      d2 = d1 * 2
      8.downto(0) do |n|
        d2 += numeros[n] * (11 - (n))
      end
      
      d2 = 11 - (d2 % 11)
      d2 = 0 if d2 >= 10

      numeros.join + d1.to_s + d2.to_s
    end

    def self.formatado
      numeros = numero.split ''
      [numeros[0..2], ".", numeros[3..5], ".", numeros[6..8], "-", numeros[9..10]].join
    end
  end
end