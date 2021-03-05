class Game
  extend Finder
  extend DataLoader
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue,
              :venue_link
  
  def initialize(data)
    @game_id      = data[0].to_i
    @season       = data[1]
    @type         = data[2]
    @date_time    = data[3]
    @away_team_id = data[4].to_i
    @home_team_id = data[5].to_i
    @away_goals   = data[6].to_i
    @home_goals   = data[7].to_i
    @venue        = data[8]
    @venue_link   = data[9]
  end
  
  alias_method :id, :game_id

  def away_team
    Team.find(away_team_id)
  end
  
  def home_team
    Team.find(home_team_id)
  end
  
  def winner
    # GameTeam.winner_of_game(game_id)
    return away_team if away_team_won?
    return home_team if home_team_won?
  end
  
  def loser
    # GameTeam.winner_of_game(game_id)
    return away_team if !away_team_won?
    return home_team if !home_team_won?
  end
  
  private
  
  def away_team_won?
    away_goals > home_goals
  end
  
  def home_team_won?
    home_goals > away_goals
  end
end