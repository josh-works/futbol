module DataLoader
  def load_data
    rows = CSV.read(path_to_data, headers: true, header_converters: :symbol)
    rows.map do |row|
      self.new(row)
    end
  end
  
  def path_to_data
    case
    when self == GameTeam
      path = 'data/game_teams.csv'
    when self == Game
      path = 'data/games.csv'
    when self == Team
      path = 'data/teams.csv'
    else
      raise "path to data not found"
    end
    path
  end
  
end