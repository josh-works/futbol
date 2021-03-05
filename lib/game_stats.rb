class GameStats
  def highest_total_score
    highest_score_game = Game.all.max_by do |game|
      game.away_goals + game.home_goals
    end
    highest_score_game.away_goals + highest_score_game.home_goals
  end
end