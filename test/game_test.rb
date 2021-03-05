require './test/test_helper'

class GameTest < Minitest::Test
  def setup
    data = "2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
    @game = Game.new(data)
  end
  
  def test_it_has_expected_attributes
    # game_id,season,type,date_time,away_team_id,home_team_id,
    # away_goals,home_goals,venue,venue_link
    # 
    assert_instance_of Integer, @game.game_id
    assert @game.season
    assert @game.type
    assert @game.date_time
    assert_instance_of Integer, @game.away_team_id
    assert_instance_of Integer, @game.home_team_id
    assert_instance_of Integer, @game.away_goals
    assert_instance_of Integer, @game.home_goals
    assert @game.venue
    assert @game.venue_link
  end
  
  def test_away_team_returns_a_team_object
    assert_instance_of Team, @game.away_team
  end
  
  def test_home_team_returns_a_team_object
    assert_instance_of Team, @game.away_team
  end
  
  def test_winner_returns_winning_team_object
    winner = @game.winner
    assert_instance_of Team, winner
  end
  
  def test_loser_returns_losing_team_object
    loser = @game.loser
    winner = @game.winner
    assert_instance_of Team, loser
    refute_equal loser.id, winner.id
  end
  
  def test_alias_id_to_game_id
    assert_equal @game.game_id, @game.id
  end
  
  def test_find_returns_game_by_id
    game = Game.find(2012030221)
    assert_equal game.id, @game.id
  end
  
  def test_all_returns_all_games
    games = Game.all
    assert_equal 7441, games.count
  end
end