class View
  def ask_for_name
    puts "What's the name of the meal?"
    print "> "
    gets.chomp
  end

  def ask_for_price
    puts "What's the price of the meal?"
    print "> "
    gets.chomp.to_i
  end

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index}. #{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for_id
    puts "Enter id of the meal you want to update"
    print "> "
    gets.chomp.to_i
  end

  def show(meal)
    puts "#{meal.id} - #{meal.name} - #{meal.price}"
  end
end
