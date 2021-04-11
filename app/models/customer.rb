class Customer
  attr_accessor :id, :name, :address
  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @id = attributes[:id]
  end

  def to_csv_row
    [@id, @name, @address]
  end

  def self.headers
    %w[id name address]
  end
end
