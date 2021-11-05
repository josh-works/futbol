gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './csv_exploration_lesson/name'

class NameTest < Minitest::Test
  
  def test_find_by_name_finds_names_by_default
    assert Name.find_by_name("Gia")
    assert_equal 31, Name.find_by_name("Gia").count
  end
  
  def test_find_by_name_finds_names_regardless_of_capitalization
    assert_equal 31, Name.find_by_name("gia").count
    assert_equal 31, Name.find_by_name("GIA").count
  end
  
  def test_all_returns_array_of_all_names
    assert_equal 29464, Name.all.count
  end
  
  def test_find_by_year_finds_year_by_string
    assert_equal 5863, Name.find_by_year("2011").count
  end
  
  def test_find_by_year_finds_year_as_integer
    assert_equal 5863, Name.find_by_year(2011).count
  end
  
  def test_where_year_returns_names_with_given_year
    query = Name.where(year: "2011")
    assert_equal query.count, 5863
  end
  
  def test_where_with_multiple_queries
    query = Name.where(year: "2011", name: "Gia")
    assert_equal 6, query.count
  end
end