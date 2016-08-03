guard :rspec, cmd: 'bundle exec rspec' do
  watch( %r{^(.+)/.+_spec.rb} ) { |m| m[1] }
  watch( %r{^(.+)/lib/.+\.rb} ) { |m| "#{m[1]}/spec" }
end
