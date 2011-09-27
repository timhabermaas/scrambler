Scrambler
=========

Scrambler is a simple gem which provides your ground-breaking cube application with random turn scrambles for all [WCA](http://www.worldcubeassociation.org/) puzzles.

Installation
------------

Install it as a gem

    gem install scrambler

or if you use Bundler to handle your dependencies, add this to your Gemfile and run `bundle`.

    gem "scrambler"

Supported Puzzles
-----------------

Here's a list of all currently supported puzzles and their corresponding class names (note: they're all contained in the `Scrambler` module):

    Puzzle    Class
    --------  ------------
    2x2x2     TwoByTwo
    3x3x3     ThreeByThree
    4x4x4     FourByFour
    5x5x5     FiveByFive
    6x6x6     SixBySix
    7x7x7     SevenBySeven
    Pyraminx  Pyraminx
    Clock     Clock

Usage
-----

Just create an instance of the puzzle class and call `scramble` on it. `scramble` usually has one optional argument which specifies the scramble length.

    require "rubygems"
    require "scrambler"

    Scrambler::ThreeByThree.new.scramble # defaults to 25 moves
    # => "U F2 L' D R U' R2 U2 F D' R' D' F2 U2 R2 B R2 D F2 R2 F' U' B2 U B'"

    Scrambler::ThreeByThree.new.scramble(10)
    # => "U2 F2 R2 B L U2 R2 D' L' F2"

    Scrambler::Clock.new.scramble # there's no scramble length parameter
    # => "UUdd u=2; d=-5 / dUdU u=-3; d=6 / ddUU u=6; d=3 / UdUd u=3; d=2 / dUUU u=5 / UdUU u=-2 / UUUd u=6 / UUdU u=4 / UUUU u=1 / dddd d=0 / UUdd"