# require some stuff...

# require the classes in minitest syntax

class GameTest < Minitest::Test
  def setup
    data = "2012030221,20122013,Postseason,5/16/13,3,6,2,3,Toyota Stadium,/api/v1/venues/null".split(',')
    @game = Game.new(data)
  end
  
  def test_it_has_expected_attributes
    # game_id,season,type,date_time,away_team_id,home_team_id,
    # away_goals,home_goals,venue,venue_link
    # 
    assert @game.game_id
    assert @game.season
    assert @game.type
    assert @game.date_time
    assert @game.away_team_id
    assert @game.home_team_id
    assert @game.away_goals
    assert @game.home_goals
    assert @game.venue
    assert @game.venue_link
    
  end
end