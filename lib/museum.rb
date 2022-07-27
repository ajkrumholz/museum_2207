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

  def patrons_by_exhibit_interest
    hash = Hash.new
    @exhibits.each do |exhibit|
      hash[exhibit] = []
    end
    hash.each do |exhibit, patron_array|
      @patrons.each do |patron|
        if recommend_exhibits(patron).include?(exhibit)
          patron_array << patron
        end
      end
    end
    hash
  end

  def ticket_lottery_contestants(exhibit)
    if patrons_by_exhibit_interest[exhibit] != nil
      patrons_by_exhibit_interest[exhibit].select do |patron|
        patron.spending_money < exhibit.cost
      end
    end
  end

  def draw_lottery_winner(exhibit)
    if ticket_lottery_contestants(exhibit) != nil
      ticket_lottery_contestants(exhibit).sample
    else
      return nil
    end
  end
end