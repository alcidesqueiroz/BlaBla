#encoding: UTF-8
module BlaBla
  class Util
    def self.diff_in_years_from(date, date_b=Date.today)  
      years = date_b.year - date.year  
      date_b < Date.civil(date_b.year, date.month, date.day) ? years - 1 : years  
    end  

    def self.sortear_por_peso params
      total_pesos = params.map{|par| par[:probabilidade]}.reduce{|a, b|a+b}
      raise "Somatório de pesos deve ser igual a 100" if total_pesos != 100
      
      c = 1
      rnd = rand 1..100
      params.each do |par|
        return par[:valor] if Range.new(c, (c += par[:probabilidade])-1).include? rnd
      end
    end
  end
end
