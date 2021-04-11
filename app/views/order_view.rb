class OrderView
  def ask_for_meal_index
    puts "Which meal index would you like to select?"
    puts "> "
    gets.chomp.to_i
  end

  def ask_for_customer_index
    puts "Which customer index would you like to select?"
    puts "> "
    gets.chomp.to_i
  end

  def ask_for_employee_index
    puts "Which employee index would you like to select?"
    puts "> "
    gets.chomp.to_i
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index}. #{enployee.id} - #{employee.name} - #{employee.role}"
    end
  end

  def display_my_orders(orders)
    orders.each_with_index do |order|
      puts "#{index}. [#{order.delivered? == true : 'X' || ' '}] - #{order.meal}"
    end
  end

  def mark_as_delivered
    puts "which order index would you like to mark as delivered?"
    puts "> "
    gets.chomp.to_i
  end
end
