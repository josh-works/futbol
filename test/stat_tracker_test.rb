require './test/test_helper'

class StatTrackerTest < Minitest::Test
  
  def setup
    @st = StatTracker.new
  end
  
  ###############################
  #       GAME STATISTICS       #
  ###############################
  def test_highest_total_score
    assert_equal 11, @st.highest_total_score
  end
  
  def test_lowest_total_score
    # Lowest sum of the winning and losing teams’ scores 	
    # => Integer
    assert_equal 0, @st.lowest_total_score
  end

  def test_percentage_home_wins
    # Percentage of games that a home team has won (rounded to the nearest 100th) 	
    # => Float
  end

  def test_percentage_visitor_wins
    # Percentage of games that a visitor has won (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_percentage_ties
    # Percentage of games that has resulted in a tie (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_count_of_games_by_season
    # A hash with season names (e.g. 20122013) as keys and counts of games as values 	
    # => Hash
    
  end

  def test_average_goals_per_game
    # Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th) 	
    # => Float
    
  end

  def test_average_goals_by_season
    # Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th) 	
    # => Hash
    
  end
end