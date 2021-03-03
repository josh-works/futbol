require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name].downcase
    @count = data[:count]
    @rank = data[:rank]
  end
  
  def self.all_names
    @all_names ||= load_name_data
  end
  
  def self.load_name_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    rows.map do |row|
      Name.new(row)
    end
  end

  def self.find_by_name(name_to_find)
    name_to_find = name_to_find.downcase
    
    all_names.select do |name|
      name.name == name_to_find
    end
  end
  
  def self.find_by_year(year)
    all_names.select do |name|
      name.year == year
    end
  end
  
  def self.count_by_year
    grouped = all_names.group_by do |name|
      name.year
    end
    grouped.reduce({}) do |talley, name|
      talley[name.first] = name[1].count
      talley
    end
  end
end

pp "grouped by year"
pp Name.count_by_year

pp "count for 2011"
pp Name.find_by_year("2011").count

pp "count for 2012"
pp Name.find_by_year("2012").count

pp "count for 2013"
pp Name.find_by_year("2013").count



