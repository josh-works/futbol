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
    return nil if home_goals == away_goals
    return home_team if home_goals > away_goals
    return away_team if away_goals > home_goals
  end

  def loser
    return nil if home_goals == away_goals
    return away_team if away_goals < home_goals
    return home_team if home_goals < away_goals
  end
  
  def total_score
    away_goals + home_goals
  end
  
  def self.total_goals_count
    Game.all.inject(0) do |sum, game|
      sum += game.total_score
    end
  end
  
  def self.sort_by_total_score(sort: :asc)
    sorted = Game.all.sort_by do |game|
      game.away_goals + game.home_goals
    end
    sorted.reverse! if sort == :desc
    sorted
  end
  
  def self.where(query)
    key = query.first[0]
    value = query[key]
    Game.all.select do |game|
      if value == :nil
        game.send(key) == nil
      else
        game.send(key) == game.send(value)
      end
    end
  end
end