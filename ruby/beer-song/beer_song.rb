class BeerSong
  attr_reader :start
  attr_reader :length

  VERSES = {
    2 => :verse_2_bottles,
    1 => :verse_1_bottle,
    0 => :verse_0_bottles
  }

  def self.recite(start, length)
    new(start, length).recite
  end

  private

  def initialize(start = 99, length = 100)
    @start = start
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

  def verse(number)
    VERSES.key?(number) ? send(VERSES[number]) : generic_verse(number)
  end

  public

  def recite
    ending = start + 1 - length
    start.downto(ending).map { |number| verse(number) }.join("\n\n") + "\n"
  end
end