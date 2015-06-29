require 'aruba/api'

module RunnerSteps
  include Aruba::Api

  step 'I run :command' do |command|
    run_interactive(command) 
    close_input
  end

  step 'I am playing :command' do |command|
    run_interactive(command) 
  end

  step 'the quiz says:' do |text|
    expect(all_stdout).to include(text)
  end

  step 'the quiz says :text' do |text|
    expect(all_stdout).to include(text)
  end

  step 'the guess is :guess' do |guess|
    if(guess == 'correct')
      type 'y'
      type 'n'
    else
      type 'n'
      type 'whatever'
      type 'whatever'
      type 'whatever'
      type 'whatever'
    end
  end

  step 'the :command has asked me for the correct answer' do |command|
    run_interactive(command)
    type 'n'
  end

  step 'the :command has asked me for a question to distinguish a :animal' do |command, animal|
    run_interactive(command)
    type 'n'
    type animal
  end

  step 'I answer :animal' do |animal|
    type(animal)
    type('whatever')
    type('whatever')
    type('whatever')
  end

  step 'the :command has learned the answer of :question for :animal' do |command, question, animal|
    run_interactive(command)
    type 'n'
    type animal
    type question
    type 'n'
  end

  step 'I start over' do
    type 'y'
    type 'y'
    type 'n'
  end
end