class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end
end