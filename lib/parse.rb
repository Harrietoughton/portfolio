require 'nokogiri'
require 'open-uri'
file = 'strawberry.html'
doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')

# doc.search('.fixed-recipe-card').each do |recipe|
#       title = recipe.search('.fixed-recipe-card__title-link').first.text.strip
#       rating = recipe.search('.stars').attr('data-ratingstars')
#       description = recipe.search('.fixed-recipe-card__description').first.text.strip
#       prep_time = recipe.search('.stars').attr('data-ratingstars')
#       number = recipe.search('.favorite').attr('data-id').text
#       p number
#     end

  def get_number_hash
    file = 'strawberry.html'
    doc = Nokogiri::HTML(File.open(file), nil, 'utf-8')
    new_hash = {}
    doc.search('.fixed-recipe-card').each do |recipe|
      name = recipe.search('.fixed-recipe-card__title-link').first.text.strip.to_sym
      number = recipe.search('.favorite').attr('data-id').text
      new_hash[name] = [number]
    end
    new_hash
  end

def prep_time(name)
    new_hash = get_number_hash
    name = name.to_sym
    number = new_hash[name]
    url = "https://www.allrecipes.com/recipe/#{number}/"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    thing = doc.search('.recipe-meta-item-body')[2].text.strip
    puts thing.class
end

prep_time("Stuffed Strawberries")