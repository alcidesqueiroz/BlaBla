# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "blabla"
  s.version     = BlaBla::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Alcides Queiroz Aguiar"]
  s.email       = ["alcidesqueiroz@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/blabla"
  s.extra_rdoc_files = ["README.md"]
  s.summary     = "Um gerador de dados fictícios, porém realísticos, para desenvolvedores brasileiros."
  s.description = s.summary

  s.files         = `git ls-files`.split($\)
  s.require_paths = ["lib"]

  s.add_development_dependency "rake", "~> 0.9.2"
end