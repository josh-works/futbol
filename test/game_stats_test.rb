require './test/test_helper'

class GameStatsTest < Minitest::Test
  def setup
    @gst = GameStats.new
  end
  
  def test_highest_total_score
    assert_equal 11, @gst.highest_total_score
  end
end