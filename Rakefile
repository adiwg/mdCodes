require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/tc*.rb']
  t.verbose = true
end

task :grunt do
  system("rm -rf ./resources/json")       # empty the public directory
  system("grunt")

  system("git add ./resources/json")
  system("git commit -m \"Updating JSON files\"")
end

desc "Run tests"
task default: %w[test]
task build: %w[grunt]