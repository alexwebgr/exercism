class RunLengthEncoding
  def self.encode(input)
    return input unless input.chars.tally.values.uniq.length > 1

    input.gsub(/(.)(\1)*/).to_a.map { |occ| "#{occ.length > 1 ? occ.length : '' }#{occ[0]}" }.join
    # input.chars.map { |char| "#{input.chars.count(char)}x#{char}" }.join
  end

  def self.decode(input)
    return input unless input.match(/[0-9]/)


  end

  def self.numeric?(char)
    !!Float(char) rescue false
  end
end