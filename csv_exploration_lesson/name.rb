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
    results = []
    query.each do |q|
      results << select_by_query(q)
    end
    require "pry"; binding.pry
    intersection_of_query_results(results)
  end
  
  def self.intersection_of_query_results(results)
    return results.flatten if results.count == 1
    
    case results.count
    when 2
      results = results[0] & results[1]
    when 3
      results = results[0] & results[1] & results[2]
    when 4
      results = results[0] & results[1] & results[2] & results[3]
    end
    
    results.flatten
  end
  
  def self.select_by_query(q)
    find_by = q.first
    criteria = q.last
    all_names.select do |name|
      name.send(find_by) == criteria
    end
  end
  
  def self.order(query)
    sort_by = query.keys.first
    direction = query[sort_by].downcase
    asc_sorted = all_names.sort_by do |name|
      name.send(sort_by)
    end
    asc_sorted.reverse! if direction == :desc
    
    asc_sorted
  end
end

# pp "Name.where(year: '2011')"
# pp Name.where(year: "2011").count
# 
# pp "ethnicity"
# pp Name.where(ethnicity: "asian and pacific islander").count
# 
# 
# pp "year & ethnicity"
# pp "Name.where(year: '2011', ethnicity: 'asian and pacific islander')"
# pp Name.where(year: "2011", ethnicity: "asian and pacific islander").count

pp "2012 & api"
pp Name.where(year: "2012", ethnicity: "asian and pacific islander").count

pp "api & 2012"
pp Name.where(ethnicity: "asian and pacific islander", year: "2012").count

pp "hispanic & 2011"
pp Name.where(ethnicity: "HISPANIC", year: "2011").count

pp "hispanic & 2011 & geraldine"
pp Name.where(ethnicity: "HISPANIC", year: "2011", name: "geraldine").count


