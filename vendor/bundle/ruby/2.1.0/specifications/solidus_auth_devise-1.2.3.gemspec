# -*- encoding: utf-8 -*-
# stub: solidus_auth_devise 1.2.3 ruby lib

Gem::Specification.new do |s|
  s.name = "solidus_auth_devise"
  s.version = "1.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Solidus Team"]
  s.date = "2015-11-30"
  s.description = "Provides authentication and authorization services for use with Solidus by using Devise and CanCan."
  s.email = "contact@solidus.io"
  s.licenses = ["BSD-3"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1")
  s.requirements = ["none"]
  s.rubygems_version = "2.2.2"
  s.summary = "Provides authentication and authorization services for use with Solidus by using Devise and CanCan."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<solidus_core>, ["< 2", ">= 1.1.0.alpha"])
      s.add_runtime_dependency(%q<devise>, ["~> 3.5.1"])
      s.add_runtime_dependency(%q<devise-encryptable>, ["= 0.1.2"])
      s.add_runtime_dependency(%q<deface>, ["~> 1.0.0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0"])
      s.add_development_dependency(%q<solidus_backend>, ["< 2", ">= 1.1.0.alpha"])
      s.add_development_dependency(%q<solidus_frontend>, ["< 2", ">= 1.1.0.alpha"])
      s.add_development_dependency(%q<rspec-rails>, ["~> 3.3"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.9.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<sass-rails>, ["~> 4.0.0"])
      s.add_development_dependency(%q<coffee-rails>, ["~> 4.0.0"])
      s.add_development_dependency(%q<shoulda-matchers>, ["~> 2.6.2"])
      s.add_development_dependency(%q<factory_girl>, ["~> 4.4"])
      s.add_development_dependency(%q<capybara>, ["~> 2.4.1"])
      s.add_development_dependency(%q<poltergeist>, ["~> 1.5"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 1.2.0"])
    else
      s.add_dependency(%q<solidus_core>, ["< 2", ">= 1.1.0.alpha"])
      s.add_dependency(%q<devise>, ["~> 3.5.1"])
      s.add_dependency(%q<devise-encryptable>, ["= 0.1.2"])
      s.add_dependency(%q<deface>, ["~> 1.0.0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<multi_json>, [">= 0"])
      s.add_dependency(%q<solidus_backend>, ["< 2", ">= 1.1.0.alpha"])
      s.add_dependency(%q<solidus_frontend>, ["< 2", ">= 1.1.0.alpha"])
      s.add_dependency(%q<rspec-rails>, ["~> 3.3"])
      s.add_dependency(%q<simplecov>, ["~> 0.9.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<sass-rails>, ["~> 4.0.0"])
      s.add_dependency(%q<coffee-rails>, ["~> 4.0.0"])
      s.add_dependency(%q<shoulda-matchers>, ["~> 2.6.2"])
      s.add_dependency(%q<factory_girl>, ["~> 4.4"])
      s.add_dependency(%q<capybara>, ["~> 2.4.1"])
      s.add_dependency(%q<poltergeist>, ["~> 1.5"])
      s.add_dependency(%q<database_cleaner>, ["~> 1.2.0"])
    end
  else
    s.add_dependency(%q<solidus_core>, ["< 2", ">= 1.1.0.alpha"])
    s.add_dependency(%q<devise>, ["~> 3.5.1"])
    s.add_dependency(%q<devise-encryptable>, ["= 0.1.2"])
    s.add_dependency(%q<deface>, ["~> 1.0.0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<multi_json>, [">= 0"])
    s.add_dependency(%q<solidus_backend>, ["< 2", ">= 1.1.0.alpha"])
    s.add_dependency(%q<solidus_frontend>, ["< 2", ">= 1.1.0.alpha"])
    s.add_dependency(%q<rspec-rails>, ["~> 3.3"])
    s.add_dependency(%q<simplecov>, ["~> 0.9.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<sass-rails>, ["~> 4.0.0"])
    s.add_dependency(%q<coffee-rails>, ["~> 4.0.0"])
    s.add_dependency(%q<shoulda-matchers>, ["~> 2.6.2"])
    s.add_dependency(%q<factory_girl>, ["~> 4.4"])
    s.add_dependency(%q<capybara>, ["~> 2.4.1"])
    s.add_dependency(%q<poltergeist>, ["~> 1.5"])
    s.add_dependency(%q<database_cleaner>, ["~> 1.2.0"])
  end
end
