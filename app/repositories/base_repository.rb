require 'csv'
class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist? @csv_file
  end

  def create(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    save_csv
  end

  def find(id)
    @elements.each do |element|
      return element if element.id == id
    end
  end

  def find_index(index)
    @elements.each_with_index do |element, index|
      return element if index == index
    end
  end

  def all
    return @elements
  end

  def update(id, new_element)
    old_element = find(id)
    @elements.delete(old_element)
    new_element.id = id
    @elements << new_element
    save_csv
  end

  def destroy(id)
    old_element = find(id)
    @elements.delete(old_element)
    save_csv
  end

  def load_csv(object = {})
    CSV.foreach(@csv_file, { headers: :first_row, header_converters: :symbol }) do |row|
      @elements << build_element(row)
      @next_id += 1
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << @elements.first.class.headers
      @elements.each { |element| csv << element.to_csv_row }
    end
  end
end
