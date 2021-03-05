module Finder
  def find(id)
    self.all.find {|obj| obj.id == id }
  end
end