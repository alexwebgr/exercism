class Hamming
  def self.compute(dna, dna2)
    raise ArgumentError if dna.length != dna2.length

    dna.each_char.with_index.count {|letter, index| p letter != dna2[index]}
  end
end