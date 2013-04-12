module BlaBlaHelpers
  def validar_cpf numero
    return false if numero.nil?
 
    invalidos = ["12345678909"] 
    0.upto(9) {|n| invalidos << (n.to_s * 11)}

    valor = numero.scan /[0-9]/
    if valor.length == 11
      unless invalidos.include? valor.join
        valor = valor.collect{|x| x.to_i}
        
        soma = 0
        0.upto(8) do |n|
          soma += (10-n)*valor[n]
        end
        soma -= (11 * (soma/11))
        
        r1 = [0,1].include?(soma) ? 0 : 11 - soma
        if r1 == valor[9]
          soma = 0
          0.upto(9) do |n|
            soma += (11-n)*valor[n]
          end

          soma -= (11 * (soma/11))
          r2 = [0,1].include?(soma) ? 0 : 11 - soma
          return true if r2 == valor[10] 
        end
      end
    end
    false 
  end  

  def validar_cnpj numero
    return false if numero.nil?
 
    invalidos = []
    0.upto(9) {|n| invalidos << (n.to_s * 14)}

    valor = numero.scan /[0-9]/
    if valor.length == 14
      unless invalidos.include? valor.join
        valor = valor.collect{|x| x.to_i}
        
        soma = 0
        0.upto(11) do |n|
          nn = 5 - n
          soma += (nn >= 2 ? nn : nn + 8)*valor[n]
        end
        soma -= (11 * (soma/11))
        
        r1 = [0,1].include?(soma) ? 0 : 11 - soma
        if r1 == valor[12]
          soma = 0
          0.upto(12) do |n|
            nn = 6 - n
            soma += (nn >= 2 ? nn : nn + 8)*valor[n]
          end

          soma -= (11 * (soma/11))
          r2 = [0,1].include?(soma) ? 0 : 11 - soma
          return true if r2 == valor[13] 
        end
      end
    end
  end  

  def validar_isbn numero
    return false if numero.nil?

    numeros = numero.split('').map &:to_i
    
    soma = numeros[0]
    1.upto(11) do |n|
      soma += numeros[n] * (n % 2 == 0 ? 1 : 3)
    end
    
    modulo = soma % 10 

    dv = 0
    dv = 10 - modulo if(modulo != 0)

    numeros[12] == dv
  end  

  def validar_cartao_credito numero
    numero = numero.to_s unless numero.class == String

    digitos = []

    1.upto(16) do |d|
      if d % 2 == 0
        n = numero[d-1].to_i
      else
        n = numero[d-1].to_i * 2
        n -= 9 if n >= 10
      end

      digitos << n
    end
      
    digitos.inject(:+) % 10 == 0
  end  

  def validar_formatacao_cpf cpf
    cpf =~ /^(\d{3}\.){2}\d{3}\-\d{2}$/
  end

  def validar_formatacao_cnpj cnpj
    cnpj =~ /^\d{2}(\.\d{3}){2}\/\d{4}\-\d{2}$/
  end

  def validar_formatacao_isbn isbn
    isbn =~ /^(\d{3}\-){2}\d{2}\-\d{4}\-\d$/
  end

  def validar_formatacao_cartao_credito numero
    numero =~ /^(\d{4} ){3}\d{4}$/
  end

  def is_number? s
     !!(s =~ /\A[+-]?\d+?(\.\d+)?\Z/)
  end

  def is_lower? c
    c >= 'a' && c <= 'z'
  end

  def is_upper? c
    ! is_lower? c
  end
end