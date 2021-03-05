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
    assert_instance_of Integer, @gt.game_id
    assert_instance_of Integer, @gt.team_id
    assert @gt.home_or_away
    assert @gt.result
    assert @gt.settled_in
    assert @gt.head_coach
    assert_instance_of Integer, @gt.goals
    assert_instance_of Integer, @gt.shots
    assert_instance_of Integer, @gt.tackles
    assert_instance_of Integer, @gt.pim
    assert_instance_of Integer, @gt.power_play_opportunities
    assert_instance_of Integer, @gt.power_play_goals
    assert_instance_of Float, @gt.face_off_win_percentage
    assert_instance_of Integer, @gt.giveaways
    assert_instance_of Integer, @gt.takeaways
  end
end