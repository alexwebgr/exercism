class LogLineParser
  LINE_REGEX = /\[(?<log_level>[A-Z]+)\]:\s*(?<message>[\w| ]+\b)/
  attr_reader :line

  def initialize(line)
    @line = LINE_REGEX.match(line)
  end

  def message
    line[:message]
  end

  def log_level
    line[:log_level].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
