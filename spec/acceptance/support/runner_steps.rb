require 'aruba/api'

module RunnerSteps
  include Aruba::Api

  step 'I run :command' do |command|
    run "#{command}"
  end

  step 'the output contains :text' do |text|
    expect(all_stdout).to include(text)
  end
end