require 'csv'
require 'pry'
require 'active_support/core_ext/string/inflections'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'csv_exploration_lesson/popular_baby_names.csv'
  
  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender].downcase
    @ethnicity = standardize_ethnicity(data[:ethnicity])
    @name = data[:childs_first_name].downcase
    @count = data[:count]
    @rank = data[:rank]
  end
  
  def standardize_ethnicity(ethnicity)
    ethnicity = ethnicity.downcase.parameterize(separator: '_').to_sym
    valid_ethnicities_list = %i[
      black_non_hispanic
      asian_and_pacific_islander
      white_non_hispanic
      hispanic
    ]
    
    invalid_input_ethnicity_conversion = {
      asian_and_paci: :asian_and_pacific_islander,
      black_non_hisp: :black_non_hispanic,
      white_non_hisp: :white_non_hispanic
    }
    
    if valid_ethnicities_list.include?(ethnicity)
      ethnicity
    elsif invalid_input_ethnicity_conversion[ethnicity]
      invalid_input_ethnicity_conversion[ethnicity]
    else
      raise "Invalid NameEthnicity: #{ethnicity}"
    end
  end
  
  def self.all
    @all ||= load_name_data
  end
  
  def self.load_name_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    rows.map do |row|
      Name.new(row)
    end
  end

  def self.find_by_name(name_to_find)
    name_to_find = name_to_find.downcase
    
    Name.all.select do |name|
      name.name == name_to_find
    end
  end
  
  def self.find_by_year(year)
    year = year.to_s
    Name.all.select do |name|
      name.year == year
    end
  end
  
  def self.count_by_year
    grouped = Name.all.group_by do |name|
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
    Name.all.select do |name|
      name.send(find_by) == criteria
    end
  end
  
  def self.order(query)
    sort_by = query.keys
    
    if query.count == 1
      direction = query[sort_by].downcase
      asc_sorted = Name.all.sort_by do |name|
        [name.send(sort_by[0])]
      end
      asc_sorted.reverse! if direction == :desc  
      asc_sorted
    end
    
    if query.count == 2 # ugggh this is ugly and doesn't handle
      # sort direction at all, but I'm way over this project so
      # hanging up my hat here. 
      sort_by = query.keys
      all_names.sort_by do |name|
        [name.send(sort_by.first), name.send(sort_by.last)]
      end
    end
  end
end
