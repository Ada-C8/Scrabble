require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["Lib"]
  t.warning = true
  t.test_files = FileList['Specs/*_spec.rb']
end

task default: :test
