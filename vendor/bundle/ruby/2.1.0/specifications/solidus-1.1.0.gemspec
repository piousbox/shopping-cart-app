# -*- encoding: utf-8 -*-
# stub: solidus 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "solidus"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.8.23") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Solidus Team"]
  s.date = "2015-11-25"
  s.description = "Solidus is an open source e-commerce framework for Ruby on Rails."
  s.email = "contact@solidus.io"
  s.homepage = "http://solidus.io"
  s.licenses = ["BSD-3"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.requirements = ["none"]
  s.rubygems_version = "2.2.2"
  s.summary = "Full-stack e-commerce framework for Ruby on Rails."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<solidus_core>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<solidus_api>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<solidus_backend>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<solidus_frontend>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<solidus_sample>, ["= 1.1.0"])
    else
      s.add_dependency(%q<solidus_core>, ["= 1.1.0"])
      s.add_dependency(%q<solidus_api>, ["= 1.1.0"])
      s.add_dependency(%q<solidus_backend>, ["= 1.1.0"])
      s.add_dependency(%q<solidus_frontend>, ["= 1.1.0"])
      s.add_dependency(%q<solidus_sample>, ["= 1.1.0"])
    end
  else
    s.add_dependency(%q<solidus_core>, ["= 1.1.0"])
    s.add_dependency(%q<solidus_api>, ["= 1.1.0"])
    s.add_dependency(%q<solidus_backend>, ["= 1.1.0"])
    s.add_dependency(%q<solidus_frontend>, ["= 1.1.0"])
    s.add_dependency(%q<solidus_sample>, ["= 1.1.0"])
  end
end
