require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs = ["Lib"]
  t.warning = true
  t.test_files = FileList['Spec/scrabble_spec.rb']
end

task default: :test
