require_relative './helper'

class StatTracker
  def self.from_csv(locations)
    StatTracker.new
  end
  
  def highest_total_score
    GameStats.highest_total_score
  end
end