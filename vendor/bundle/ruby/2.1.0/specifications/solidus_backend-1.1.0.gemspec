# -*- encoding: utf-8 -*-
# stub: solidus_backend 1.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "solidus_backend"
  s.version = "1.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Solidus Team"]
  s.date = "2015-11-25"
  s.description = "Admin interface for the Solidus e-commerce framework."
  s.email = "contact@solidus.io"
  s.homepage = "http://solidus.io"
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.requirements = ["none"]
  s.rubyforge_project = "solidus_backend"
  s.rubygems_version = "2.2.2"
  s.summary = "Admin interface for the Solidus e-commerce framework."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<solidus_api>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<solidus_core>, ["= 1.1.0"])
      s.add_runtime_dependency(%q<bourbon>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-ui-rails>, ["~> 5.0.0"])
      s.add_runtime_dependency(%q<select2-rails>, ["= 3.5.9.1"])
      s.add_runtime_dependency(%q<handlebars_assets>, [">= 0"])
    else
      s.add_dependency(%q<solidus_api>, ["= 1.1.0"])
      s.add_dependency(%q<solidus_core>, ["= 1.1.0"])
      s.add_dependency(%q<bourbon>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<jquery-ui-rails>, ["~> 5.0.0"])
      s.add_dependency(%q<select2-rails>, ["= 3.5.9.1"])
      s.add_dependency(%q<handlebars_assets>, [">= 0"])
    end
  else
    s.add_dependency(%q<solidus_api>, ["= 1.1.0"])
    s.add_dependency(%q<solidus_core>, ["= 1.1.0"])
    s.add_dependency(%q<bourbon>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<jquery-ui-rails>, ["~> 5.0.0"])
    s.add_dependency(%q<select2-rails>, ["= 3.5.9.1"])
    s.add_dependency(%q<handlebars_assets>, [">= 0"])
  end
end
