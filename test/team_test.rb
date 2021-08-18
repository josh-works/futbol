require './test/test_helper'

class TeamTest < Minitest::Test
  def setup
    data = "1,23,Atlanta United,ATL,Mercedes-Benz Stadium,/api/v1/teams/1".split(",")
    @team = Team.new(data)
  end
  
  def test_it_has_expected_attributes
    # team_id,franchiseId,teamName,abbreviation,Stadium,link
    assert @team.team_id
    assert @team.franchise_id
    assert @team.team_name
    assert @team.abbreviation
    assert @team.stadium
    assert @team.link
  end
  
  def test_find_class_method_finds_team_by_id
    assert_instance_of Team, Team.find(1)
  end
  
  def test_find_all_returns_all_teams
    results = Team.all
    assert_equal 32, results.count
    assert_instance_of Team, results.first
  end
  
  def test_alias_team_id_to_id
    assert_equal @team.id, @team.team_id
  end
  
  def test_games_finds_games_with_given_team
    game_data = "2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
    game = Game.new(game_data)
    assert_equal @team.games, [game] 
  end
  
  def test_avg_goal_per_game_all_seasons
    assert_equal 2.2, @team.avg_goal_per_game_all_seasons
  end
end