require './test/test_helper'

class GameMakerTest < Minitest::Test
  def test_it_makes_game_object
    data = {
      game_id: 1,
			season: 11,
			type: "PostSeason",
			home_team_id: 2,
			away_team_id: 3,
			home_goals: 4,
			away_goals: 5
    }
    game = GameMaker.new(data)

    assert_instance_of Game, game
    assert_equal data[:game_id], game.game_id
    assert_equal data[:season], game.season
    assert_equal data[:home_goals], game.home_goals
  end
end