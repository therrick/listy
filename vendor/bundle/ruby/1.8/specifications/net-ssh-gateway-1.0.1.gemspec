# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{net-ssh-gateway}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamis Buck"]
  s.date = %q{2009-02-01}
  s.description = %q{A simple library to assist in establishing tunneled Net::SSH connections}
  s.email = %q{jamis@jamisbuck.org}
  s.files = ["test/gateway_test.rb"]
  s.homepage = %q{http://net-ssh.rubyforge.org/gateway}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{net-ssh-gateway}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{A simple library to assist in establishing tunneled Net::SSH connections}
  s.test_files = ["test/gateway_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<net-ssh>, [">= 1.99.1"])
      s.add_development_dependency(%q<echoe>, [">= 0"])
    else
      s.add_dependency(%q<net-ssh>, [">= 1.99.1"])
      s.add_dependency(%q<echoe>, [">= 0"])
    end
  else
    s.add_dependency(%q<net-ssh>, [">= 1.99.1"])
    s.add_dependency(%q<echoe>, [">= 0"])
  end
end
