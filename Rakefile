require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = []
  t.warning = true
  t.test_files = FileList['./*_specs.rb']
end

task default: :test
