require './test/test_helper'

class GameStatsTest < Minitest::Test
  def test_highest_total_score
    assert_equal 11, GameStats.highest_total_score
  end
end