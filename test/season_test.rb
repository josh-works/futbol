require './test/test_helper'

class SeasonTest < Minitest::Test
  def setup
    season = "20122013"
    data_1 = "2012030221,#{season},Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
    @game_1 = Game.new(data_1)
    data_2 = "2012030221,#{season},Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
    @game_2 = Game.new(data_2)
    @season = Season.new(id: season, games: [@game_1, @game_2])
  end
  def test_it_groups_games_by_season
    assert_equal "20122013", @season.id
    assert @season.games
    assert_includes @season.games, @game_1
    assert_includes @season.games, @game_2
  end
  
  def test_season_all_returns_all_seasons
    result = Season.all
    assert_equal 6, result.count
    assert_equal 806, result[0].games.count
  end
  
  def test_total_goals_returns_all_goals_in_season
    season = Season.all.first
    assert_equal season.total_goals, 3322
  end
end