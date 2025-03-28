# frozen_string_literal: true

class Tournament
  attr_reader :input
  attr_reader :results

  def initialize(input)
    @input = input
    @results = {}
  end

  def self.tally(input)
    new(input).tally
  end

  def tally
    build_stats
    calculate_points
    build_table
  end

  def build_stats
    @results = input.split("\n").each_with_object({}) do |result, memo|
      home_team, rival_team, outcome = result.split(';').map(&:strip)

      unless memo.key?(home_team)
        memo[home_team] = {
          mp: 0,
          win: 0,
          draw: 0,
          loss: 0,
          points: 0
        }
      end

      memo[home_team][:mp] += 1
      memo[home_team][:win] += 1 if win?(outcome)
      memo[home_team][:draw] += 1 if draw?(outcome)
      memo[home_team][:loss] += 1 if loss?(outcome)

      unless memo.key?(rival_team)
        memo[rival_team] = {
          mp: 0,
          win: 0,
          draw: 0,
          loss: 0,
          points: 0
        }
      end

      memo[rival_team][:mp] += 1
      memo[rival_team][:win] += 1 if loss?(outcome)
      memo[rival_team][:draw] += 1 if draw?(outcome)
      memo[rival_team][:loss] += 1 if win?(outcome)
    end
  end

  def calculate_points
    results.each do |_, result|
      result[:points] = (result[:win] * 3) + result[:draw]
    end
  end

  def sorted_results
    results.sort_by { |team, stats| [-stats[:points], team] }.to_h
  end

  def build_table
    [
      table_header,
      table_rows,
    ].join("\n")
  end

  def table_header
    "Team                           | MP |  W |  D |  L |  P"
  end

  def table_rows
    rows = sorted_results.map do |team, result|
      "#{team.ljust(30)} | #{result[:mp].to_s.rjust(2)} | #{result[:win].to_s.rjust(2)} | #{result[:draw].to_s.rjust(2)} | #{result[:loss].to_s.rjust(2)} | #{result[:points].to_s.rjust(2)}"
    end.join("\n")

    rows + "\n"
  end

  def win?(outcome)
    outcome == "win"
  end

  def draw?(outcome)
    outcome == "draw"
  end

  def loss?(outcome)
    outcome == "loss"
  end
end
