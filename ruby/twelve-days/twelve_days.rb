# frozen_string_literal: true
require 'humanize'

class TwelveDays
  LAST_ITEM = [1, "a Partridge in a Pear Tree."]
  ITEMS = [
    [2, "Turtle Doves"],
    [3, "French Hens"],
    [4, "Calling Birds"],
    [5, "Gold Rings"],
    [6, "Geese-a-Laying"],
    [7, "Swans-a-Swimming"],
    [8, "Maids-a-Milking"],
    [9, "Ladies Dancing"],
    [10, "Lords-a-Leaping"],
    [11, "Pipers Piping"],
    [12, "Drummers Drumming"],
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
      items.prepend([item.first.humanize, item.last].join(' '))
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
