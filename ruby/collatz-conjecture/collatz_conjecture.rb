class CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n < 1

    return 0 if n == 1
    return steps(n / 2) + 1 if n.even?
    return steps(n * 3 + 1) + 1 if n.odd?
  end
end