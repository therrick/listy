# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "net-ssh-gateway"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jamis Buck"]
  s.date = "2009-02-01"
  s.description = "A simple library to assist in establishing tunneled Net::SSH connections"
  s.email = "jamis@jamisbuck.org"
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "lib/net/ssh/gateway.rb", "README.rdoc"]
  s.files = ["CHANGELOG.rdoc", "lib/net/ssh/gateway.rb", "README.rdoc"]
  s.homepage = "http://net-ssh.rubyforge.org/gateway"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Net-ssh-gateway", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "net-ssh-gateway"
  s.rubygems_version = "1.8.24"
  s.summary = "A simple library to assist in establishing tunneled Net::SSH connections"

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
