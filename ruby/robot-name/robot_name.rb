class Robot
  AVAILABLE_NAMES = Enumerator.new do |yielder|
    all_names = ("AA100".."ZZ999").to_a

    loop do
      all_names.shuffle.each { |name| yielder << name }
    end
  end

  def self.forget
    nil
  end

  def name
    @name ||= AVAILABLE_NAMES.next
  end

  def reset
    @name = nil
  end
end