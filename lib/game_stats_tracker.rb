require './lib/helper'

class GameStatsTracker
  def self.highest_total_score
    Game.all.max_by do |game|
      game.away_goals + game.home_goals
    end
  end
end