Scrambler
=========

Scrambler is a simple gem which provides your ground-breaking cube application with random turn scrambles for all [WCA](http://www.worldcubeassociation.org/) puzzles.

Installation
------------

Install it as a gem

    gem install scrambler

or if you use Bundler to handle your dependencies, add this to your Gemfile and run `bundle`

    gem "scrambler"

Usage
-----

    Scrambler::Pyraminx.new.scramble # defaults to 25 turns
    # => "l' r L' R L B R B' U B' U' R' U B' U' L' R U' B U R L U' R' U'"

    Scrambler::Pyraminx.new.scramble(5)
    # => "l' r' u L B'"