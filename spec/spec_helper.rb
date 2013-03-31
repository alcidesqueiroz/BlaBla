require 'support/blabla_helpers'

$:.unshift File.expand_path('../lib', __FILE__)
require 'blabla'

RSpec.configure do |c|
  c.include BlaBlaHelpers
end