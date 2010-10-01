begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "barcodeservice"
    gem.summary = %Q{lightwight barcode image server running on Heroku.com}
    gem.description = %Q{Run your own barcode image generator for free on Heroku.com}
    gem.email = "gitcommit@6brand.com"
    gem.homepage = "http://github.com/JackDanger/barcodeservice"
    gem.authors = ["Jack Danger Canty"]
    gem.add_development_dependency "shoulda", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end



task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << '.'
  test.pattern = 'test.rb'
  test.verbose = true
end
