# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'animal_quiz/version'

Gem::Specification.new do |spec|
  spec.name          = "animal_quiz"
  spec.version       = AnimalQuiz::VERSION
  spec.authors       = ["Ashish Sehra"]
  spec.email         = ["asehra@gmail.com"]

  spec.summary       = %q{ANIMAL QUIZ}
  spec.description   = %q{ANIMAL QUIZ}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ["animal-quiz"]
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "turnip"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "pry"
end
