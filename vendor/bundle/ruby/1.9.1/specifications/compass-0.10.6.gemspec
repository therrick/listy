# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "compass"
  s.version = "0.10.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Eppstein", "Eric A. Meyer", "Brandon Mathis"]
  s.date = "2010-10-27"
  s.description = "Compass is a Sass-based Stylesheet Framework that streamlines the creation and maintainance of CSS."
  s.email = "chris@eppsteins.net"
  s.executables = ["compass"]
  s.files = ["bin/compass"]
  s.homepage = "http://compass-style.org"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "A Real Stylesheet Framework"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<haml>, [">= 3.0.4"])
    else
      s.add_dependency(%q<haml>, [">= 3.0.4"])
    end
  else
    s.add_dependency(%q<haml>, [">= 3.0.4"])
  end
end
