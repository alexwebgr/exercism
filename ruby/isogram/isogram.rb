# Isogram
# Determine if a word or phrase is an isogram.
# An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, however
# spaces and hyphens are allowed to appear multiple times.

class Isogram
  IGNORED = ["-", " "]

  def self.isogram?(word)
    new(word).isogram?
  end

  private

  attr_reader :word
  attr_reader :letters
  attr_reader :ignored

  def initialize(word, ignored = IGNORED)
    @word = word.downcase
    @ignored = ignored
  end

  def letters
    @letters ||= ignored.empty? ?
                   word.chars :
                   word.scan(/[^#{Regexp.quote(ignored.join)}]/)
                 .tally
  end

  def nth_order_isogram
    @nth_order_isogram ||= letters.values.uniq
  end

  def ordinalize(num)
    case num % 10
    when 1
      return "#{num}st"
    when 2
      return "#{num}nd"
    when 3
      return "#{num}rd"
    else
      return "#{num}th"
    end
  end
  public

  def isogram?(order = 0)
    nth_order_isogram.size <= 1 && order == nth_order_isogram.first ||
      nth_order_isogram.size <= 1
  end

  def to_s
    if nth_order_isogram.size <= 1
      "You gave \"#{word}\" and it is a #{ordinalize(nth_order_isogram.first)} order isogram."
    else
      "You gave \"#{word}\" and it is not an isogram."
    end
  end
end

if defined? Minitest
  describe 'Reporting' do
    describe 'A report method' do
      describe 'when not an isogram' do
        it 'must give details' do
          actual = Isogram.new('bananas').to_s
          expected = 'You gave "bananas" and it is not an isogram.'
          _(actual).must_equal expected
        end
      end

      describe 'when it is an isogram' do
        it 'must give details 1st level' do
          actual = Isogram.new('isogram').to_s
          expected = 'You gave "isogram" and it is a 1st order isogram.'
          _(actual).must_equal expected
        end

        it 'must give details 2nd level' do
          actual = Isogram.new('deed').to_s
          expected = 'You gave "deed" and it is a 2nd order isogram.'
          _(actual).must_equal expected
        end
      end
    end
  end
end

