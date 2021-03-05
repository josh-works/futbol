require './lib/helper'

class GameTeam
  extend DataLoader
  extend Finder
  attr_reader :game_id,
              :team_id,
              :home_or_away,
              :result,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :tackles,
              :pim,
              :power_play_opportunities,
              :power_play_goals,
              :face_off_win_percentage,
              :giveaways,
              :takeaways
                
  def initialize(data)
    @game_id = data[0].to_i
    @team_id = data[1].to_i
    @home_or_away = data[2]
    @result = data[3]
    @settled_in = data[4]
    @head_coach = data[5]
    @goals = data[6].to_i
    @shots = data[7].to_i
    @tackles = data[8].to_i
    @pim = data[9].to_i
    @power_play_opportunities = data[10].to_i
    @power_play_goals = data[11].to_i
    @face_off_win_percentage = data[12].to_f
    @giveaways = data[13].to_i
    @takeaways = data[14].to_i
  end
  
  def self.find_by_game_id(id)
    GameTeam.all.find {|gameteam| gameteam.game_id == id }
  end
end