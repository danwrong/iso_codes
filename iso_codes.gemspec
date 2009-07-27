# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{iso_codes}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Webb"]
  s.date = %q{2009-07-27}
  s.description = %q{Gem for finding and listing ISO codes for countries, currencies and languages}
  s.email = %q{dan@danwebb.net}
  s.extra_rdoc_files = ["CHANGELOG", "lib/iso_codes/base.rb", "lib/iso_codes/country.rb", "lib/iso_codes/currency.rb", "lib/iso_codes/data/countries.rb", "lib/iso_codes/data/currencies.rb", "lib/iso_codes/data/languages.rb", "lib/iso_codes/language.rb", "lib/iso_codes.rb", "LICENSE", "README"]
  s.files = ["CHANGELOG", "lib/iso_codes/base.rb", "lib/iso_codes/country.rb", "lib/iso_codes/currency.rb", "lib/iso_codes/data/countries.rb", "lib/iso_codes/data/currencies.rb", "lib/iso_codes/data/languages.rb", "lib/iso_codes/language.rb", "lib/iso_codes.rb", "LICENSE", "Manifest", "Rakefile", "README", "test/country_test.rb", "test/currency_test.rb", "test/language_test.rb", "test/test_helper.rb", "iso_codes.gemspec"]
  s.homepage = %q{http://github.com/danwrong/iso_codes/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Iso_codes", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{iso_codes}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Gem for finding and listing ISO codes for countries, currencies and languages}
  s.test_files = ["test/country_test.rb", "test/currency_test.rb", "test/language_test.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<fastercsv>, [">= 0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<fastercsv>, [">= 0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<fastercsv>, [">= 0"])
  end
end
