# Isogram

Determine if a word or phrase is an isogram.

An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.

Examples of isograms:

- lumberjacks
- background
- downstream
- six-year-old

The word *isograms*, however, is not an isogram, because the s repeats.

* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby isogram_test.rb

To include color from the command line:

    ruby -r minitest/pride isogram_test.rb


## Source

Wikipedia [https://en.wikipedia.org/wiki/Isogram](https://en.wikipedia.org/wiki/Isogram)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.

how are you generating the documentation?

we begin with the assumption that user doesn't know that the word or phrase they are providing is an isogram let alone the order of it.

we could use a range and iterate over it calling `nth_order_isogram?` with the order, although i feel that it makes the code 
a bit more cryptic also it could harbor bugs or unexpected behaviour that ccould be difficult to debug 
`(1..3).each { |order| return true if nth_order_isogram? order }`
so i prefer to be more verbose 
```ruby
  def isogram?
    return true if nth_order_isogram? 1
    return true if nth_order_isogram? 2
    return true if nth_order_isogram? 3

    false
  end
```

then we could also come up with a creative way use `define_method`

now for the transformation of `@letters` we could use delete_if
```ruby
    @letters = word.downcase.chars.tally

    @letters.delete_if do |key|
      ignored_repeats.include? key
    end
```

or scan with a making `ignored_repeats` a regex with a negated list of characters to exclude 
```ruby
    @letters = word.downcase.scan(ignored_repeats).tally

```
    