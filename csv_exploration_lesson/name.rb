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
end

pp "count for Ian"
pp Name.find_by_name("Ian").count

pp "count for Megan"
pp Name.find_by_name("Megan").count

pp "count for Sal"
pp Name.find_by_name("Sal").count

pp "count for Omar"
pp Name.find_by_name("Omar").count

pp "count for Riley"
pp Name.find_by_name("Riley").count

pp "count for Hunter"
pp Name.find_by_name("Hunter").count
