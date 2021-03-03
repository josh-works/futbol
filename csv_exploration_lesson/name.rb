require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender].downcase
    @ethnicity = data[:ethnicity].downcase
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
  
  def self.where(query)
    find_by = query.keys.first
    criteria = query[find_by].downcase
    
    all_names.select do |name|
      name.send(find_by) == criteria
    end
  end
end

pp "where name = 'geraldine'"
pp Name.where(name: 'geraldine').count
pp "where year = '2014'"
pp Name.where(year: '2014').count
pp "where gender = 'male'"
pp Name.where(bio_gender: 'male').count

pp "top ranked names:"
pp Name.where(rank: "1")



