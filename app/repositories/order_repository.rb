require 'csv'
require_relative '../models/order'
require_relative 'meal_repository'
require_relative 'customer_repository'
require_relative 'employee_repository'

class OrderRepository
  def initialize(orders_csv_path, meal_repository, customer_repository, employee_repository)
    @orders_csv_path = orders_csv_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@orders_csv_path)
  end

  def create(order)
    order.id = @next_id
    @orders << order
    @next_id += 1
    save_csv
  end

  def undelivered_orders
    @orders.select { |order| order.delivered? == false }
  end

  def list_my_orders(username)
    @orders.select { |order| order.employee? == username }
  end

  def save_csv
    CSV.open(@orders_csv_path, "wb") do |csv|
      csv << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@orders_csv_path, csv_options) do |row|
      id = row[:id].to_i
      order = Order.new
      meal = @meal_repository.find(row[:meal_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      order.id = id
      order.meal = meal
      order.employee = employee
      order.customer = customer
      order.delivered = row[:delivered] == "true"
      @orders << order
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end
