class Season
  attr_reader :games, :id
  def initialize(data)
    @id = data[:id]
    @games = data[:games]
  end
  
  def self.all
    @all ||= generate_season_data
  end
  
  private
  
  def self.generate_season_data
    grouped = Game.all.group_by do |game|
      game.season
    end
    grouped.map do |data|
      Season.new(id: data[0], games: data[1])
    end
  end
end