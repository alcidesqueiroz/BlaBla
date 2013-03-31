#encoding: UTF-8
require 'spec_helper'

describe BlaBla do
  describe "Gerador de CPF" do
    describe ".numero" do
      it "deveria gerar um número de 11 dígitos" do
        BlaBla::CPF.numero.size.should == 11
      end

      it "deveria gerar um CPF válido" do
        10.times { validar_cpf(BlaBla::CPF.numero).should be_true }
      end
    end

    describe ".formatado" do
      it "deveria gerar um CPF no formato xxx.xxx.xxx-xx" do
        numero = BlaBla::CPF.formatado
        validar_formatacao_cpf(numero).should be_true
      end
    end
  end  

  describe "Gerador de CNPJ" do
    describe ".numero" do
      it "deveria gerar um número de 14 dígitos" do
        BlaBla::CNPJ.numero.size.should == 14
      end

      it "deveria gerar um CNPJ válido" do
        10.times { validar_cnpj(BlaBla::CNPJ.numero).should be_true }
      end
    end

    describe ".formatado" do
      it "deveria gerar um CNPJ no formato xx.xxx.xxx/xxxx-xx" do
        numero = BlaBla::CNPJ.formatado
        validar_formatacao_cnpj(numero).should be_true
      end
    end
  end  

  describe "Gerador de Cartão de Crédito" do
    describe ".numero" do
      it "deveria gerar um número de 16 dígitos" do
        BlaBla::CartaoCredito.numero.size.should == 16
      end

      it "deveria gerar números válidos" do
        10.times { validar_cartao_credito(BlaBla::CartaoCredito.numero).should be_true }
      end
    end

    describe ".formatado" do
      it "deveria gerar um número de cartão no formato xxxx xxxx xxxx xxxx" do
        numero = BlaBla::CartaoCredito.formatado
        validar_formatacao_cartao_credito(numero).should be_true
      end
    end
  end  

  describe "Geradores de Bacon Ipsum e de Lorem Ipsum" do
    before do
      @geradores = [BlaBla::Lorem, BlaBla::Bacon]
    end

    describe ".palavra" do
      it "deveria gerar uma única palavra" do
        @geradores.each do |g| 
          g.palavra.split.size.should == 1
        end
      end
    end

    describe ".palavras" do
      it "deveria gerar um vetor de palavras com a quantidade especificada" do
        @geradores.each do |g| 
          g.palavras(10).size.should == 10
        end
      end
    end

    describe ".frase" do
      it "A frase deveria iniciar com letra maiúscula e terminar com ponto" do
        @geradores.each do |g| 
          frase = g.frase
          is_upper?(frase[0]).should be_true
          frase[-1].should == "."
        end
      end
    end

    describe ".frases" do
      it "deveria gerar um vetor de frases com a quantidade especificada" do
        @geradores.each do |g| 
          g.frases(10).size.should == 10
        end
      end
    end

    describe ".paragrafo" do
      it "deveria gerar um parágrafo com mais de uma frase" do
        @geradores.each do |g| 
          (g.paragrafo.split(".").size > 2).should be_true
        end
      end
    end

    describe ".paragrafos" do
      it "deveria gerar um vetor de parágrafos com a quantidade especificada" do
        @geradores.each do |g| 
          g.paragrafos(10).size.should == 10
        end
      end
    end
  end
end
