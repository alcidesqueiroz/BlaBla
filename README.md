BlaBla
=====

O Que é?
--------

BlaBla é uma gem para geração de dados fictícios, porém verossímeis, para aplicações em português do Brasil.

Sim, eu conheço o Faker, e sei que é possível definir o default_locale para pt-BR. 
Porém, para a realidade das nossas aplicações, o Faker fica devendo muita coisa.

###A versão inicial(0.0.1) já conta com:

*	Gerador de CPF
*	Gerador de CNPJ
*	Gerador de Cartão de Crédito
*	Gerador de Bacon Ipsum
*	Gerador de Lorem Ipsum
*	Gerador de Nomes Próprios de Pessoas

###Para as próximas versões devem vir:

*	Gerador de CEP	
*	Gerador de Endereços
*	Gerador de URLs
*	Gerador de Email
*	Gerador de ISBN
*	Gerador de Telefones
*	Gerador de Senhas
*	Entre outras coisas ... =)

Por que não o Faker?
--------------------
O Faker é uma ótima gem, porém os dados gerados não parecem muito "realísticos" em aplicações brasileiras, possui poucos geradores, e os mesmos não são focados em nossa realidade.

Instalando
----------
```bash
sudo gem install blabla
```

Uso
-----
```ruby
BlaBla::CPF.numero  #=> "67021487983"

BlaBla::CNPJ.formatado  #=> "51.777.676/0001-27"

BlaBla::CartaoCredito.formatado(:bandeira => :visa)  #=> "4398 2852 4214 7717"

BlaBla::Pessoa.nome  #=> "Viviane Alves Almeida"

BlaBla::Bacon.frase  #=> "Flank round belly chuck mignon jowl ham beef mignon."
```

Contribuindo
------------
Se você deseja contribuir, faça um Fork do [repo](https://github.com/alcidesqueiroz/faker) no Github, faça as suas alterações e mande um pull request.

**Nota importante**

Rode `bundle install` e `rspec` para confirmar que os testes estão passando.

Contato
-------
Estou aberto a sugestões, elogios, críticas ou qualquer outro tipo de comentário. 

*	Grupo de discussão: https://groups.google.com/forum/#!forum/blabla-gem
*	Twitter: @alcidesqueiroz

Licença
-------
Esse código é livre para ser usado dentro dos termos da licença MIT license
