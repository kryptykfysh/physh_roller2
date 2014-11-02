PhyshRoller
===========

A simple dice rolling application.

Usage
=====

Command Line
------------

If you've installed the gem, you can simply run:

```
dice <the_dice_string_i_want_to_roll>
```

Example dice strings are 4d6, 20d100-20, 14D2+6. Basically, anything that matches the regular expression /\A(\d+)?d(\d+)([\+-]\d*)?\z/i.

Command line help is available with

```
dice --help
```

Now supports FATE dice rolls with:

```
dice -f
```

As A Module
-----------

You can require physh_roller in a Ruby application and then create dicerolls.

For example:

```ruby
dice_roll = PhyshRoller::DiceRoll.new('2d10+30')
dice_roll.roll_dice
first_roll = dice_roll.results
dice_roll.roll_dice
second_roll = dice_roll.results
first_total = first_roll[:sum]
second_total = second_roll[:sum]
```

Documentation
=============

More documentation is available in RDoc format in the /doc folder.

Why Have You Done This Thing?
=============================

I play RPGs a lot. A lot of the tools I build relate to these games and most of them use dice rolls. I got fed up having to do stuff on the fly and decided to do the thing properly.

This is also my first real excursion in to really using BDD/TDD. I might have paid lip service to writing tests first, but the end goal was working code. This time I'm (hopefully) doing it right.

If you have the time, please take a look at the Cucumber and RSpec test suite and let me know where it can be improved. That goes for the rest of the code too. :)

Where Does It Go From Here
==========================

I fully intend to add functionality for exploding dice (reroll on maximum, or a threshold), successes on individual dice (as per Shadowrun or nWoD).

Again, if there are any other dice strangenesses you would like to see implemented, please do let me know.
TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/physh_roller/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
