require "./lib/scrambler/version"

Gem::Specification.new do |s|
  s.name         = "scrambler"
  s.version      = Scrambler::VERSION
  s.date         = "2011-09-27"
  s.summary      = "Scrambler for cubes and other puzzles"
  s.description  = ""
  s.authors      = ["Tim Habermaas"]
  s.email        = "t.habermaas@gmail.com"
  s.homepage     = "https://github.com/timhabermaas/scrambler"

  s.files        = ["lib/scrambler.rb"]
  s.require_path = "lib"

  s.add_development_dependency "rspec", "~> 2.6.0"
end