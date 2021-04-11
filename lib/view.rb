require_relative "controller"
require_relative "recipe"

class View
  def display(recipes)
    puts " "
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1}. [#{recipe.done == true ? 'X' : ' '}] #{recipe.name}      #{recipe.rating}/5    prep-time: #{}"
    end
  end

  def title
    puts "what is the title of your recipe?"
    puts "> "
    gets.chomp
  end

  def description
    puts "what is the description of your recipe?"
    puts "> "
    gets.chomp
  end

  def ask_user_index
    puts " "
    puts "which number recipe would you like to select?"
    puts "> "
    gets.chomp.to_i - 1
  end

  def ask_ingredient
    puts "What would you like to cook today?"
    puts "> "
    gets.chomp
  end

  def ask_rating
    puts "What is the rating of this recipe?"
    puts "> "
    gets.chomp.to_i
  end

  def ask_prep
    puts "How long does this take to prep?"
    puts "> "
    gets.chomp
  end
end
