require './test/test_helper'

class GameStatsTrackerTest < Minitest::Test
  def setup
    @gst = GameStatsTracker.new
  end
  
  def test_highest_total_score
    assert_equal 32, @gst.highest_total_score
  end
end