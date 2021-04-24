class BeerSong
  attr_reader :amount
  attr_reader :length

  GENERIC_THRESHOLD = 2
  VERSES = {
    2 => :verse_2_bottles,
    1 => :verse_1_bottle,
    0 => :verse_0_bottles
  }

  def initialize(amount = 99, length = 100)
    @amount = amount
    @length = length
  end

  def generic_verse(i)
    [
      "#{i} bottles of beer on the wall, #{i} bottles of beer.",
      "Take one down and pass it around, #{i - 1} bottles of beer on the wall."
    ].join("\n")
  end

  def verse_2_bottles
    [
      "2 bottles of beer on the wall, 2 bottles of beer.",
      "Take one down and pass it around, 1 bottle of beer on the wall."
    ].join("\n")
  end

  def verse_1_bottle
    [
      "1 bottle of beer on the wall, 1 bottle of beer.",
      "Take it down and pass it around, no more bottles of beer on the wall."
    ].join("\n")
  end

  def verse_0_bottles
    [
      "No more bottles of beer on the wall, no more bottles of beer.",
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    ].join("\n")
  end

  def self.recite(amount, length)
    new(amount, length).recite
  end

  def recite
    verses = []

    if VERSES.key?(amount)
      if length > 1
        amount.downto(0) { |time| verses << send(VERSES[time]) }
      else
        verses << send(VERSES[amount])
      end
    else
      length.times do |time|
        current_time = amount - time
        if current_time <= GENERIC_THRESHOLD
          verses << send(VERSES[current_time])
        else
          verses << generic_verse(current_time)
        end
      end
    end

    verses.join("\n\n") + "\n"
  end
end