class Nucleotide
  ELEMENTS = {
    'A' => 0,
    'C' => 0,
    'G' => 0,
    'T' => 0
  }.freeze

  def self.from_dna(sequence)
    validate(sequence)
    new(sequence)
  end

  def self.validate(sequence)
    raise ArgumentError if sequence.match(/[^ACGT]/)
  end

  private
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  public
  def from_dna
    sequence.chars
  end

  def count(letter)
    from_dna.count(letter)
  end

  def histogram
    from_dna.each_with_object(ELEMENTS.dup) { |letter, elements| elements[letter] += 1 }
  end
end