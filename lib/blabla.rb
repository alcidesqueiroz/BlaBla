require 'yaml'

module BlaBla
  @@strings = nil
  
  def self.root_dir
    File.expand_path(File.dirname(File.expand_path(__FILE__)) + "/..")
  end

  def self.strings_file
    File.join(root_dir, "lib", "strings", "strings.yml")
  end

  def self.strings key=nil
    @@strings ||= YAML.load_file(strings_file)["blabla"]
    parse_string_key key
  end

  
  private 

  def self.parse_string_key key
    return @@strings if key.nil?
    key_parts = key.split(/[\.,>]/)
    
    ret = @@strings
    key_parts.each do |part|
      ret = ret[part];
    end

    ret
  end
end


require_relative "./utilities/util"
require_relative "version"

def require_generator(name) require_relative "./generators/#{name}"; end

require_generator 'cpf'
require_generator 'cnpj'
require_generator 'pessoa'
require_generator 'cartao_credito'
require_generator 'texto/base'
require_generator 'texto/bacon'
require_generator 'texto/lorem'