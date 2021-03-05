require './test/test_helper'

class GameTeamTest < Minitest::Test
  def setup
    data = "2012030221,3,away,LOSS,OT,John Tortorella,2,8,44,8,3,0,44.8,17,7"
          .split(",")
    @gt = GameTeam.new(data)
  end
  
  def test_it_has_expected_attributes
    # game_id,team_id,HoA,result,settled_in,head_coach,goals,shots,tackles,
    # pim,powerPlayOpportunities,powerPlayGoals,faceOffWinPercentage,giveaways,
    # takeaways
    assert @gt.game_id
    assert @gt.team_id
    assert @gt.home_or_away
    assert @gt.result
    assert @gt.settled_in
    assert @gt.head_coach
    assert @gt.goals
    assert @gt.shots
    assert @gt.tackles
    assert @gt.pim
    assert @gt.power_play_opportunities
    assert @gt.power_play_goals
    assert @gt.face_off_win_percentage
    assert @gt.giveaways
    assert @gt.takeaways
  end
end