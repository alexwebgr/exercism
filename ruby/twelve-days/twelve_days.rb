# frozen_string_literal: true

class TwelveDays
  LAST_ITEM = [1, "a Partridge in a Pear Tree."]
  ITEMS = [
    [2, "two Turtle Doves"],
    [3, "three French Hens"],
    [4, "four Calling Birds"],
    [5, "five Gold Rings"],
    [6, "six Geese-a-Laying"],
    [7, "seven Swans-a-Swimming"],
    [8, "eight Maids-a-Milking"],
    [9, "nine Ladies Dancing"],
    [10, "ten Lords-a-Leaping"],
    [11, "eleven Pipers Piping"],
    [12, "twelve Drummers Drumming"],
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

  private

  def verse(head, body, tail = nil)
    [head, body, tail].join
  end

  def first
    [verse(prefix(LAST_ITEM.first), LAST_ITEM.last)]
  end

  def rest
    items = []

    ITEMS.map do |item|
      items.prepend(item.last)
      verse(prefix(item.first), items.join(', '), suffix)
    end
  end

  def prefix(i)
    "On the #{ORDINAL_NUMBERS[i]} day of Christmas my true love gave to me: "
  end

  def suffix
    ", and #{LAST_ITEM.last}"
  end

  public

  def song
    [].concat(first, rest).join("\n\n") + "\n"
  end
end
