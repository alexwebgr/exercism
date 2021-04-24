# frozen_string_literal: true

class TwelveDays
  LAST_ITEM = "a Partridge in a Pear Tree."
  ITEMS = [
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming",
  ]

  ORDINAL_NUMBERS = {
    1 => 'first',
    2 => 'second',
    3 => 'third',
    4 => 'fourth',
    5 => 'fifth',
    6 => 'sixth',
    7 => 'seventh',
    8 => 'eighth',
    9 => 'ninth',
    10 => 'tenth',
    11 => 'eleventh',
    12 => 'twelfth'
  }

  def self.song
    new.song
  end

  def song
    items = []
    verses = []
    verses << [prefix(1), LAST_ITEM].join

    ITEMS.each_with_index do |item, index|
      items.prepend(item)
      verses << [prefix(index + 2), items.join(', '), suffix].join
    end

    verses.join("\n\n") + "\n"
  end

  def prefix(i)
    "On the #{ORDINAL_NUMBERS[i]} day of Christmas my true love gave to me: "
  end

  def suffix
    ", and #{LAST_ITEM}"
  end
end
