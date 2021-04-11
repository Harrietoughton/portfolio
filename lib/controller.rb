require_relative "cookbook"
require_relative "recipe"
require_relative "view"
require 'nokogiri'
require 'open-uri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    new_recipe = Recipe.new(@view.title, @view.description, @view.ask_rating, false, @view.ask_prep)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    @view.display(@cookbook.all)
    @cookbook.remove_recipe(@view.ask_user_index)
  end

  def import
    keyword = @view.ask_ingredient
    recipe_list = []
    new_hash = {}
    url = "https://www.allrecipes.com/search/results/?wt=#{keyword}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.fixed-recipe-card').each do |recipe|
      name = recipe.search('.fixed-recipe-card__title-link').first.text.strip
      rating = recipe.search('.stars').attr('data-ratingstars').to_s.to_f.round(2)
      description = recipe.search('.fixed-recipe-card__description').first.text.strip
      number = recipe.search('.favorite').attr('data-id').text
      p number
      name = name.to_sym
      new_hash[name] = number
      url = "https://www.allrecipes.com/recipe/#{number}/"
      doc = Nokogiri::HTML(open(url), nil, 'utf-8')
      prep_time = doc.search('.recipe-meta-item-body').first.text.strip
      new_recipe = Recipe.new(name, description, rating, false, prep_time)
      recipe_list << new_recipe
    end
    sample_recipes = @view.display(recipe_list.sample(5))
    recipe_index = @view.ask_user_index
    @cookbook.add_recipe(sample_recipes[recipe_index])
  end

  def mark_as_done
    @view.display(@cookbook.all)
    index = @view.ask_user_index
    chosen_recipe = @cookbook.recipes[index]
    chosen_recipe.mark_as_done
    @cookbook.save_to_csv
  end
end
