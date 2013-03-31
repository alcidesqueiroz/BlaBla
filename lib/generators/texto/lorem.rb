#encoding: UTF-8
module BlaBla
  class Lorem < Texto::Base
    #Definições de peso no sorteio de palavras do gerador.
    #Para textos com aparência mais natural, ranges de tamanhos menores devem 
    #possuir maior chance de serem sorteados, portanto, como exemplo, 
    #pode-se atribuir ao range de 1..6 uma probabilidade de 80%, ou seja, 
    #palavras de 1 a 6 letras tem 80% de chance de serem sorteadas.

    def self.peso_por_tamanho_palavra 
      [
        {
          :probabilidade => 80,
          :valor => 1..5
        },
        {
          :probabilidade => 12,
          :valor => 6..8
        },
        {
          :probabilidade => 6,
          :valor => 9..10
        },
        {
          :probabilidade => 2,
          :valor => 11..12
        }
      ]
    end
    
    def self.generator_name
      "lorem"
    end
  end
end