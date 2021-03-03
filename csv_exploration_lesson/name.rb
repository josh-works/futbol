require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name]
    @count = data[:count]
    @rank = data[:rank]
  end

  def self.find_by_name(name)
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    result = []
    rows.each do |row|
      result << Name.new(row)
    end
    
    result
  end
end

pp Name.find_by_name("josh")