#encoding: UTF-8
require 'date'

module BlaBla
  class Pessoa
    def self.perfil_completo params={}
      #ToDo
    end

    def self.nome params={}
      primeiro_nome(params) + " " + sobrenome(params)
    end

    def self.primeiro_nome params={}
      sexo = params[:sexo]
      sexo = [:masculino, :feminino].sample if sexo.nil?

      BlaBla.strings("pessoa>#{sexo == :masculino ? "homens" : "mulheres" }>nomes").sample.capitalize
    end

    def self.sobrenome params={}
      sexo = params[:sexo]
      
      if sexo == :masculino
        agnome = BlaBla::Util.sortear_por_peso [
          {
            :valor => nil,
            :probabilidade => 95
          },
          {
            :valor => BlaBla.strings("pessoa>homens>agnomes").sample,
            :probabilidade => 5
          }
        ]
      end

      quantidade_sobrenomes = BlaBla::Util.sortear_por_peso [
        {
          :valor => 2,
          :probabilidade => 65
        },
        {
          :valor => 3,
          :probabilidade => 32
        },
        {
          :valor => 4,
          :probabilidade => 3
        }
      ]

      quantidade_sobrenomes -= 1 unless agnome.nil?

      sobrenomes = []
      disponiveis = BlaBla.strings("pessoa>sobrenomes")

      while sobrenomes.size < quantidade_sobrenomes
        sorteado = disponiveis.sample
        sobrenomes << sorteado unless sobrenomes.include? sorteado
      end  

      sobrenomes << agnome unless agnome.nil?

      capitalize_all sobrenomes.join(" ")
    end

    def self.idade params={}
      unless params[:data_nascimento].nil?
        raise "Data de nascimento não é do tipo Date" if params[:data_nascimento].class != Date
        BlaBla::Util.diff_in_years_from(params[:data_nascimento]) 
      else
        unless params[:faixa].nil?
          faixa = params[:faixa]
          
          if faixa == :crianca
            rand(0..11)
          elsif faixa == :adolescente
            rand(12..18)
          elsif faixa == :adulto
            rand(19..60)
          elsif faixa == :idoso
            rand(60..90)
          elsif faixa.class == Range
            rand(faixa)
          else
            raise "Faixa de idade inválida"
          end
        else
          rand(18..70)
        end
      end
    end

    def self.data_nascimento params={}
      #ToDo
    end

    def self.sexo params={}
      #ToDo
    end

    def self.pai params={}
      #ToDo
    end

    def self.mae params={}
      #ToDo
    end

    def self.filho params={}
      #ToDo
    end

    private

    def self.capitalize_all string
      string.split(' ').map {|w| w.capitalize }.join(' ')
    end
  end
end