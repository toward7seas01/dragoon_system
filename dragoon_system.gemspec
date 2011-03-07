# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dragoon_system}
  s.version = "0.1.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["zhanyinan"]
  s.date = %q{2011-03-07}
  s.description = %q{personal suit, you can see test suit in induction_cannon_01}
  s.email = %q{toward7seas@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "config/locales/en.yml",
    "config/locales/zh-CN.yml",
    "dragoon_system.gemspec",
    "lib/action_controller/base_patch.rb",
    "lib/active_record/base_patch.rb",
    "lib/application_helper_patch.rb",
    "lib/dragoon_system.rb",
    "lib/generators/dragoon_system/install_generator.rb",
    "lib/generators/templates/application.js",
    "lib/object_patch.rb",
    "lib/string_patch.rb"
  ]
  s.homepage = %q{http://github.com/toward7seas01/dragoon_system}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.2}
  s.summary = %q{personal suit, you can see test suit in induction_cannon_01}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mysql2>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.5"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.10"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
    else
      s.add_dependency(%q<mysql2>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.0.5"])
      s.add_dependency(%q<bundler>, ["~> 1.0.10"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<rcov>, [">= 0"])
    end
  else
    s.add_dependency(%q<mysql2>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.0.5"])
    s.add_dependency(%q<bundler>, ["~> 1.0.10"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<rcov>, [">= 0"])
  end
end

