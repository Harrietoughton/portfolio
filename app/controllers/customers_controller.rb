require './app/repositories/customer_repository'
require './app/views/customer_view'

class CustomersController
  def initialize(customer_repository)
    @view = CustomerView.new
    @customer_repository = customer_repository
  end

  def add
    # in View ask the user for name
    customer_name = @view.ask_for_name
    # in View ask for the address
    customer_address = @view.ask_for_address
    # create a new instance of the customer class & call create method from the repository to save the instance
    new_customer = Customer.new(name: customer_name, address: customer_address)
    @customer_repository.create(new_customer)
  end

  def list
    customers = @customer_repository.all
    @view.display(customers)
  end

  def update
    customer_id = @view.ask_for_id
    new_name = @view.ask_for_name
    new_address = @view.ask_for_address
    updated_customer = Customer.new(name: new_name, address: new_address)
    @customer_repository.update(customer_id, updated_customer)
  end

  def find_customer
    customer_id = @view.ask_for_id
    customer = @customer_repository.find(customer_id)
    @view.show(customer)
  end

  def destroy
    customer_id = @view.ask_for_id
    @customer_repository.destroy(customer_id)
  end
end
