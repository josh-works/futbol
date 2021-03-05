module Finder
  def find(id)
    self.all.find {|obj| obj.id == id }
  end
  
  def all
    @all ||= load_data
  end
end