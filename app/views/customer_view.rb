class CustomerView
  def ask_for_name
    puts "What's the name?"
    print "> "
    gets.chomp
  end

  def ask_for_address
    puts "What's your address?"
    print "> "
    gets.chomp
  end

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index}. #{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_id
    puts "Enter id of the customer you want to update"
    print "> "
    gets.chomp.to_i
  end
  
  def show(customer)
    puts "#{customer.id} - #{customer.name} - #{customer.address}"
  end
end