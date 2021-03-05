require 'csv'
require './lib/finder'

class Team
  extend Finder
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
  
  alias_method :id, :team_id
  
  def self.all
    @all ||= load_teams_data
  end
  
  private
  
  def self.load_teams_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    rows.map do |row|
      Team.new(row)
    end
  end
end