require_relative 'meal_repository'
require_relative 'customer_repository'
require_relative 'employee_repository'
require_relative 'base_repository'
require_relative 'order_repository'
require_relative 'session_view'
require_relative 'order_view'
require_relative 'customer_view'
require_relative 'meal_view'

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @order_view = OrderView.new
    @meal_view = View.new
    @customer_view = CustomerView.new
    @session_view = SessionView.new
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
  end

  def add
    # return an array of meals
    meals = @meal_repository.all
    # return list of the above organised as index, id, meal name, price
    @meal_view.display(meals)
    # return meal index from user 
    meal_index = @order_view.ask_for_meal_index
    # find meal based on index given
    meal = @meal_repository.find_index(meal_index)
    # return an array of customers
    customers = @customer_repository.all
    # return list of the above organised as index, id, name and address
    @customer_view.display(customers)
    # return index taken from user
    customer_index = @customer_view.ask_for_customer_index
    # find customer based on index given
    customer = @customer_repository.find_index(customer_index)
    
    # return an array of employees
    employees = @employee_repository.all
    # return list of the above organised as index, id, etc 
    @order_view.display(employees)
    # return index taken from user 
    employee_index = @order_view.ask_for_employee_index
    # find employee based on index given
    employee = @employee_repository.find_index(employee_index)

    order = Order.new(meal: meal, customer: customer, employee: employee)
  end

  def list_undelivered_orders
    @order_repository.undelivered_orders
  end

  def list_my_orders
    username = @session_view.ask_for_username
    orders = @order_repository.list_my_orders(username)
    @order_view.display_my_orders(orders)
  end

  def mark_as_delivered(order)
    orders = list_my_orders
    index = @order_view.mark_as_delivered
    orders.each_with_index do |order, index|
      return order if index == index
    end
  order.deliver!
  list_my_orders
  end
end
