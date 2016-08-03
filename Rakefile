begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |spec|
    spec.exclude_pattern = '{natural-sort,simple-spreadsheet}/spec/*_spec.rb'
    spec.pattern = '*/spec/*_spec.rb'
    spec.verbose = false
  end

  task :default => :spec
rescue LoadError
end
