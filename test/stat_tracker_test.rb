require './test/test_helper'

class StatTrackerTest < Minitest::Test
  
  def setup
    @st = StatTracker.new
  end
  
  def test_highest_total_score
    assert_equal 32, @st.highest_total_score
  end
end