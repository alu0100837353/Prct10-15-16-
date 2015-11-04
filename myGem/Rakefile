require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc ""
task :build do 
    sh "bundle build myGem"
end

desc ""
task :install do 
    sh "bundle install myGem"
end

desc ""
task :release do 
    sh ""
end

desc "Run RSpec code examples"
task :spec do 
    sh "rspec -Ilib -Ispec spec/biblio_spec.rb"
end


