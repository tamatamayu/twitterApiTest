# -*- encoding: utf-8 -*-
# stub: fastri 0.3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "fastri"
  s.version = "0.3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mauricio Fernandez"]
  s.date = "2008-02-02"
  s.description = "FastRI is an alternative to the ri command-line tool. It is *much* faster, and also allows you to offer RI lookup services over DRb. FastRI is smarter than ri, and can find classes anywhere in the hierarchy without specifying the \"full path\". FastRI can perform fast full-text searches. It also knows about gems, and can tell you e.g. which extensions to a core class were added by a specific gem."
  s.email = "mfp@acm.org"
  s.executables = ["fri", "qri", "fastri-server", "ri-emacs"]
  s.files = ["bin/fastri-server", "bin/fri", "bin/qri", "bin/ri-emacs"]
  s.homepage = "http://eigenclass.org/hiki/fastri"
  s.post_install_message = "\nA small note about RubyGems + FastRI\n====================================\nRubyGems adds a noticeable overhead to fri, making it run slower than if you\ninstalled it directly from the tarball with setup.rb.\n\nCompare the execution time when installed with RubyGems:\n  $ time fri -f plain String > /dev/null\n\n  real\t0m0.385s\n  user\t0m0.244s\n  sys\t0m0.036s\n\nto the time fri actually takes to run, without the overhead introduced by \nRubyGems:\n  $ time ruby bin/fri -f plain String > /dev/null\n\n  real\t0m0.088s\n  user\t0m0.040s\n  sys\t0m0.008s\n\nIf you care about those extra 300ms (and there are situations where they will\nmatter, e.g. when using fri for method completion), get FastRI from the\ntarballs.\n\n"
  s.rdoc_options = ["--title", "FastRI: better, faster ri"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubygems_version = "2.4.5.1"
  s.summary = "RI docs across machines, faster and smarter than ri."

  s.installed_by_version = "2.4.5.1" if s.respond_to? :installed_by_version
end
