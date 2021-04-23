class Clock

  private

  def initialize(hour: 0, minute: 0)
    @minutes = hour * 60 + minute
  end

  def calc(minutes)
    [(minutes / 60) % 24, minutes % 60]
  end

  def display(minutes)
    '%02d:%02d' % calc(minutes)
  end

  protected

  attr_accessor :minutes

  public

  def ==(other)
    calc(other.minutes) == calc(minutes)
  end

  def -(other)
    Clock.new(minute: @minutes - other.minutes)
  end

  def +(other)
    Clock.new(minute: @minutes + other.minutes)
  end

  def to_s
    display(minutes)
  end
end
