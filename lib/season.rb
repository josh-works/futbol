class Season
  attr_reader :games, :id
  def initialize(data)
    @id = data[:id]
    @games = data[:games]
  end
end