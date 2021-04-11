class Meal
  attr_accessor :id, :name, :price
  def initialize(attributes = {})
    @name = attributes[:name]
    @price = attributes[:price]
    @id = attributes[:id]
  end
  def to_csv_row
    [@id, @name, @price]
  end
  def self.headers
    %w[id name price]
  end
end