def fizzbuzz?(index)
  return true if ((index + 1) % 3).zero? && ((index + 1) % 5).zero?
end

def fizz_buzz(number)
  # TODO: return an array of integers, 'Fizz', 'Buzz' or 'FizzBuzz'
  raise ArgumentError if number < 1

  array = (1..number).to_a
  array.each_with_index do |_item, index|
    if fizzbuzz?(index) == true
      array[index] = "FizzBuzz"
    elsif ((index + 1) % 3).zero?
      array[index] = "Fizz"
    elsif ((index + 1) % 5).zero?
      array[index] = "Buzz"
    end
  end
end
