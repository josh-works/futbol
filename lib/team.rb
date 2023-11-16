class Team
  extend Finder
  extend DataLoader
  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link,
              :all
  @@filename = 'data/teams.csv'
  
              
  def initialize(data)
    @team_id = data[0].to_i
    @franchise_id = data[1]
    @team_name = data[2]
    @abbreviation = data[3]
    @stadium = data[4]
    @link = data[5]
  end
  
  def games
    Game.find_by_team(self.id)
  end
  
  def avg_goal_per_game_all_seasons
    # something here to get avg goal per 
    # game in a given season
  end
  
  
  alias_method :id, :team_id
end