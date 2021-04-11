require 'csv'
require_relative "recipe"

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], (row[3] == "true"), row[4])
    end
  end

  def all
    return @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def save_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.done, recipe.prep_time]
      end
    end
  end
end
