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
    assert_equal 0.44, @st.percentage_home_wins
  end

  def test_percentage_visitor_wins
    # Percentage of games that a visitor has won (rounded to the nearest 100th) 	
    # => Float
    assert_equal 0.36, @st.percentage_visitor_wins
  end

  def test_percentage_ties
    # Percentage of games that has resulted in a tie (rounded to the nearest 100th) 	
    # => Float
    assert_equal 0.2, @st.percentage_ties
  end

  def test_count_of_games_by_season
    # A hash with season names (e.g. 20122013) as keys and counts of games as values 	
    # => Hash
    data = {
      "20122013"=>806, 
      "20162017"=>1317, 
      "20142015"=>1319, 
      "20152016"=>1321, 
      "20132014"=>1323, 
      "20172018"=>1355
    }
    assert_equal data, @st.count_of_games_by_season
  end

  def test_average_goals_per_game
    # Average number of goals scored in a game across all seasons including both home and away goals (rounded to the nearest 100th) 	
    # => Float
    assert_equal 4.22, @st.average_goals_per_game
  end

  def test_average_goals_by_season
    # Average number of goals scored in a game organized in a hash with season names (e.g. 20122013) as keys and a float representing the average number of goals in a game for that season as values (rounded to the nearest 100th) 	
    # => Hash
    expected = {
      "20122013"=>4.12,
      "20162017"=>4.23,
      "20142015"=>4.14,
      "20152016"=>4.16,
      "20132014"=>4.19,
      "20172018"=>4.44
    }
    assert_equal expected, @st.average_goals_by_season
  end
  
  ###############################
  #      LEAGUE STATISTICS      #
  ###############################
  
  def test_count_of_teams
    assert_equal 32, @st.count_of_teams
  end
  
  def test_best_offense
    assert_equal "Reign FC", @st.best_offense
  end
end