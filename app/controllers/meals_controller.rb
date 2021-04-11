require './app/repositories/meal_repository'
require './app/views/meal_views'
class MealsController
  def initialize(meal_repository)
    @view = View.new
    @meal_repository = meal_repository
  end

  def add
    # in View ask the user for name
    meal_name = @view.ask_for_name
    # in View ask for the price
    meal_price = @view.ask_for_price
    # create a new instance of the meal class & call create method from the repository to save the instance
    @meal_repository.create(Meal.new(name: meal_name, price: meal_price))
  end

  def list
    meals = @meal_repository.all
    @view.display(meals)
  end

  def update
    meal_id = @view.ask_for_id
    new_name = @view.ask_for_name
    new_price = @view.ask_for_price
    updated_meal = Meal.new(name: new_name, price: new_price)
    @meal_repository.update(meal_id, updated_meal)
  end

  def find
    meal_id = @view.ask_for_id
    meal = @meal_repository.find(meal_id)
    @view.show(meal)
  end

  def destroy
    list
    meal_id = @view.ask_for_id
    meal = @meal_repository.find(meal_id)
    meals_array = @meal_repository.all
    meals_array.delete(meal)
    list
  end
end
