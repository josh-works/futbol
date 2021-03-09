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
  
  ###############################
  #       GAME STATISTICS       #
  ###############################
  
  def test_sort_by_total_score
    lowest_score = Game.sort_by_total_score.first
    highest_score = Game.sort_by_total_score.last
    assert_equal 0, lowest_score.total_score
    assert_equal 11, highest_score.total_score
  end
  
  def test_sort_by_total_score_with_argument
    highest_score = Game.sort_by_total_score(sort: :desc)
    lowest_score = Game.sort_by_total_score(sort: :asc)
    assert_equal 0, lowest_score.first.total_score
    assert_equal 11, highest_score.first.total_score
  end
  
  def test_where_home_team_won
    assert_equal 3237, Game.where(winner: :home_team).count
  end
  
  def test_where_away_team_won
    assert_equal 2687, Game.where(winner: :away_team).count
  end
  
  def test_where_no_winner
    assert_equal 1517, Game.where(winner: :nil).count
  end
  
  
  
  def test_when_no_winner
    data = {
      home_goals: 3,
      away_goals: 3
    }
    game = GameMaker.new(data)
    assert_equal 3, game.home_goals
    assert_equal 3, game.away_goals
    assert_nil game.winner
  end
  
  def test_sum
    results = Game.total_goals_count
    assert_equal 31413, results
  end
end