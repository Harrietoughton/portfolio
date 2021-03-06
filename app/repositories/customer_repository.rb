require './app/models/customer'
require 'csv'
require_relative "base_repository"
class CustomerRepository < BaseRepository
  private
  def build_element(row)
    row[:id] = row[:id].to_i
    row[:name] = row[:name]
    row[:address] = row[:address]
    Customer.new(row)
  end
end
