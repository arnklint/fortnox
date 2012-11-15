# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fortnox/version"

Gem::Specification.new do |s|
  s.name        = "fortnox"
  s.version     = Fortnox::VERSION
  s.authors     = ["Jonas Arnklint", "Kevin Sjöberg"]
  s.email       = ["jonas@fkw.se", "kev.sjoberg@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Handle invoices and customers through the Fortnox API}
  s.description = %q{Handle invoices and customers through the Fortnox API}

  s.rubyforge_project = "fortnox"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "vcr"
  s.add_development_dependency "webmock"

  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "gyoku"
end
