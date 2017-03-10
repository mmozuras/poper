require 'support/coverage'

require 'rspec'
require 'rspec/its'

require 'poper'

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed

  config.expect_with(:rspec) { |c| c.syntax = :should }
  config.mock_with(:rspec) { |c| c.syntax = :should }
end
