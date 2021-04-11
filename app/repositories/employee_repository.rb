require "csv"
require_relative "../models/employee"

class EmployeeRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @employees = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
    @next_id = @employees.last.id + 1 unless @employees.empty?
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << %w[id username password role]
      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.address, employee.password]
      end
    end
  end

  def all
    @employees
  end

  def all_riders
    @employees.select { |employee| employee.role == "rider" }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

   def find_index(index)
    @employees.each_with_index do |employee, index|
      return employee if index == index
    end
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end
end
