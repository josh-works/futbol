module Finder
  def find(id)
    self.all.find {|obj| obj.id == id }
  end
  
  def all
    @all ||= load_data
  end
  
  def load_data
    data_location = {
      :Team => 'data/teams.csv',
      :Game => 'data/games.csv',
      :GameTeam => 'data/game_teams.csv'
    }

    rows = CSV.read(data_location[self.to_s.to_sym], headers: true, header_converters: :symbol)
    rows.map do |row|
      self.new(row)
    end
  end
end