require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'

  def initialize(data)
    require "pry"; binding.pry
    # @year = 
    # @bio_gender = 
    # @ethnicity = 
    # @name = 
    # @count = 
    # @rank = 
  end

  def self.find_by_name(name)
    rows = CSV.read(@@filename, headers: true)
    result = []
    name = Name.new(rows.first)
    # new code goes here
    
    result
  end
end

Name.find_by_name("josh")