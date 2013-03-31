#encoding: UTF-8
module BlaBla
  module Texto
    class Base 
      def self.palavra
        tamanho = BlaBla::Util.sortear_por_peso peso_por_tamanho_palavra

        palavras_gerador.reject{|p| p.size < tamanho.min || p.size > tamanho.max}.sample
      end

      def self.palavras quantidade
        sorteadas = []

        while sorteadas.size < quantidade do 
          sorteada = palavra
          sorteadas << sorteada unless sorteadas.last == sorteada
        end
        sorteadas
      end

      def self.frase params={}
        raise "Parâmetros inválidos" if params.class != Hash

        frase = ""
        tamanho = 7..16


        if params[:comeco_padrao]
          frase = comeco_padrao + " "
          tamanho = (comeco_padrao.split.size + 4)..16
        end

        tamanho = rand(tamanho)
        tem_virgula = true
        
        #frases com menos de dez palavras poderão não possuir vírgula
        tem_virgula = rand(1..3) != 3 if tamanho < 10

        if tem_virgula
          posicao_virgula = (tamanho / 2) + rand(0..(tamanho/2 - 3)) * (rand(1..2)==2 ? 1:-1) 
          
          if params[:comeco_padrao]
            tamanho_comeco_padrao = comeco_padrao.split.size
            posicao_virgula = tamanho - rand(3..(tamanho-tamanho_comeco_padrao)) if posicao_virgula < tamanho_comeco_padrao
          end
        end

        palavras_frase = frase.split + palavras(tamanho - frase.split.size)
        palavras_frase.insert posicao_virgula, "," if tem_virgula
        (palavras_frase.join(" ") + ".").gsub(" ,", ",").capitalize
      end

      def self.frases quantidade
        sorteadas = []
        1.upto(quantidade) { sorteadas << frase }
        sorteadas
      end

      def self.paragrafo params={}
        raise "Parâmetros inválidos" if params.class != Hash
        tamanho = rand(4..10)
        frases_paragrafo = []
        if params[:comeco_padrao]
          frases_paragrafo << frase(:comeco_padrao => true)
          tamanho -= 1
        end

        1.upto(tamanho) { frases_paragrafo << frase }
        frases_paragrafo.join " "
      end

      def self.paragrafos quantidade
        sorteados = []
        1.upto(quantidade) { sorteados << paragrafo }
        sorteados
      end

      def self.comeco_padrao
        BlaBla.strings "texto>#{generator_name}>comeco_padrao"
      end

      def self.palavras_gerador
        BlaBla.strings "texto>#{generator_name}>palavras"
      end
    end
  end
end