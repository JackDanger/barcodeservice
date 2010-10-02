# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{barcodeservice}
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jack Danger Canty"]
  s.date = %q{2010-10-02}
  s.description = %q{Run your own barcode image generator for free on Heroku.com}
  s.email = %q{gitcommit@6brand.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    ".gems",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "barcodeservice.gemspec",
     "config.ru",
     "lib/barcode_service.rb",
     "lib/barcodeservice.rb",
     "test.rb"
  ]
  s.homepage = %q{http://github.com/JackDanger/barcodeservice}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{lightwight barcode image server running on Heroku.com}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<sinatra>, [">= 0"])
      s.add_runtime_dependency(%q<gbarcode>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<sinatra>, [">= 0"])
      s.add_dependency(%q<gbarcode>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<sinatra>, [">= 0"])
    s.add_dependency(%q<gbarcode>, [">= 0"])
  end
end

