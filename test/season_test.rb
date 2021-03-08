require './test/test_helper'

class SeasonTest < Minitest::Test
  def test_it_groups_games_by_season
    game_1 = {
      home_team_id: 1,
      away_team_id: 2
    }
    game_2 = {
      home_team_id: 3,
      away_team_id: 4
    }
    season = Season.new(id: "12/12/12", games: [game_1, game_2])
    assert_equal "12/12/12", season.id
    assert season.games
    assert_includes season.games, game_1
    assert_includes season.games, game_2
  end
end