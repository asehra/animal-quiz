$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'animal_quiz'
require 'aruba'

Dir.glob(::File.expand_path('../acceptance/support/*.rb', __FILE__)).each { |f| require_relative f }

RSpec.configure { |c| c.include RunnerSteps }