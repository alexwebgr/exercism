class Array
  def keep
    self.select{ |element| yield element }
  end

  def discard
    self.reject{ |element| yield(element) }
  end
end