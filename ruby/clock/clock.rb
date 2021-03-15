class Clock
  attr_accessor :hour
  attr_accessor :minute

  private

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def display(hour, minute)
    total_minutes = hour * 60 + minute
    "%02d:%02d" % [(total_minutes / 60) % 24, total_minutes % 60]
  end

  public

  def ==(object)
    display(object.hour, object.minute) == display(hour, minute)
  end

  def -(object)
    @minute -= object.minute
    @hour -= object.hour
    self
  end

  def +(object)
    @hour += object.hour
    @minute += object.minute
    self
  end

  def to_s
    display(hour, minute)
  end
end