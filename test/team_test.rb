require './test/test_helper'

class TeamTest < Minitest::Test
  def setup
    data = "1,23,Atlanta United,ATL,Mercedes-Benz Stadium,/api/v1/teams/1".split(",")
    @team = Team.new(data)
  end
  
  def test_it_has_expected_attributes
    # team_id,franchiseId,teamName,abbreviation,Stadium,link
    assert @team.team_id
    assert @team.franchise_id
    assert @team.team_name
    assert @team.abbreviation
    assert @team.stadium
    assert @team.link
  end
end