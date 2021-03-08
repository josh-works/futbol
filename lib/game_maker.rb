module GameMaker
  def self.new(data)
    Game.new([
      data[:game_id],
    	data[:season],
    	data[:type],
    	data[:date_time],
    	data[:away_team_id],
    	data[:home_team_id],
    	data[:away_goals],
    	data[:home_goals],
    	data[:venue],
    	data[:venue_link]
    ])
  end
end