class Museum
  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(new_exhibit)
    @exhibits << new_exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.select { |exhibit| patron.interests.include?(exhibit.name) }
  end

  def admit(patron)
    @patrons << patron
  end
end