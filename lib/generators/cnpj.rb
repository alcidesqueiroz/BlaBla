module BlaBla
  class CNPJ
    def self.numero
      numeros = []

      1.upto(8) do
        numeros << rand(0..9)
      end
      numeros.concat [0, 0, 0, 1]

      d1 = 0
      
      11.downto(0) do |n|
        n2 = (n >= 4? n : n + 8)
        d1 += numeros[n] * (13 - (n2))
      end
      
      d1 = 11 - (d1 % 11)
      d1 = 0 if d1 >= 10

      d2 = d1 * 2
      11.downto(0) do |n|
        n2 = (n >= 5? n : n + 8)
        d2 += numeros[n] * (14 - (n2))
      end
      
      d2 = 11 - (d2 % 11)
      d2 = 0 if d2 >= 10

      numeros.join + d1.to_s + d2.to_s
    end

    def self.formatado
      numeros = numero.split ''
      [numeros[0..1], ".", numeros[2..4], ".", numeros[5..7], "/", numeros[8..11], "-", numeros[12..13]].join
    end
  end
end