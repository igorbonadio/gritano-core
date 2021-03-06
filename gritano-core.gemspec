# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gritano-core"
  s.version = "2.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Igor Bonadio"]
  s.date = "2013-07-03"
  s.description = "Gritano::Core is a library that defines all Gritano's Models. It can be used to develop tools that manage users, repositories and permissions."
  s.email = "igorbonadio@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc",
    "TODO"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".travis.yml",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "db/development.yml",
    "db/migrate/001_create_users.rb",
    "db/migrate/002_create_keys.rb",
    "db/migrate/003_create_repositories.rb",
    "db/migrate/004_create_permissions.rb",
    "gritano-core.gemspec",
    "lib/gritano-core.rb",
    "lib/gritano-core/key.rb",
    "lib/gritano-core/migration.rb",
    "lib/gritano-core/permission.rb",
    "lib/gritano-core/repository.rb",
    "lib/gritano-core/user.rb",
    "spec/key.pub",
    "spec/key_spec.rb",
    "spec/migration_spec.rb",
    "spec/permission_spec.rb",
    "spec/repository_spec.rb",
    "spec/spec_helper.rb",
    "spec/user_spec.rb"
  ]
  s.homepage = "http://github.com/igorbonadio/gritano-core"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Gritano::Core is a library that defines all Gritano's Models."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, ["~> 4.0.0.rc1"])
      s.add_runtime_dependency(%q<grit>, ["~> 2.5.0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.13.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7.0"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.7"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 1.0.1"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, ["~> 4.0.0.rc1"])
      s.add_dependency(%q<grit>, ["~> 2.5.0"])
      s.add_dependency(%q<rspec>, ["~> 2.13.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.7.0"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.7"])
      s.add_dependency(%q<database_cleaner>, ["~> 1.0.1"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, ["~> 4.0.0.rc1"])
    s.add_dependency(%q<grit>, ["~> 2.5.0"])
    s.add_dependency(%q<rspec>, ["~> 2.13.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.7.0"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.7"])
    s.add_dependency(%q<database_cleaner>, ["~> 1.0.1"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
  end
end

