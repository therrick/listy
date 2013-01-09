# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_list}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Bates, Rails Core"]
  s.date = %q{2008-07-20}
  s.description = %q{Gem version of acts_as_list Rails plugin.}
  s.email = %q{ryan (at) railscasts (dot) com}
  s.files = ["test/list_test.rb"]
  s.homepage = %q{http://github.com/ryanb/acts-as-list}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{acts-as-list}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Gem version of acts_as_list Rails plugin.}
  s.test_files = ["test/list_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
