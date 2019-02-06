# Representing negative numbers in Ruby

This repo accompanies the article “[Representations count](https://codon.com/representations-count)”.

It contains a challenge: how would you add support for negative numbers on a
(hypothetical) computer which only has [natural numbers](https://en.wikipedia.org/wiki/Natural_number)
built in?

In practice, that means implementing the constructor, factory methods and
instance methods of the [`SignedNumber` class](lib/signed_number.rb). That
class includes a [refinement](lib/no_negative_numbers.rb) which discourages you
from accidentally using negative numbers.

## Getting started

1. `git clone https://github.com/tomstuart/negative-numbers.git`
2. `cd negative-numbers`
3. `bundle install`
4. `bundle exec rspec`
5. Edit [`lib/signed_number.rb`](lib/signed_number.rb) to make the next failing test pass
6. If more failing tests remain, go to 4
7. Celebrate! 🎉

## Two solutions

One way to solve this challenge is to represent a signed number as the
combination of a “sign” (positive or negative) and a “size” (absolute
magnitude). See the [`sign-and-size` branch](https://github.com/tomstuart/negative-numbers/compare/master...sign-and-size)
for a worked solution.

An alternative is to represent a signed number as the _difference_ between [two natural numbers](https://en.wikipedia.org/wiki/Negative_number#Formal_construction_of_negative_integers).
See the [`left-and-right`
branch](https://github.com/tomstuart/negative-numbers/compare/master...left-and-right)
for a worked solution.

The first representation is easier to understand, but the second is arguably
easier to implement correctly.
