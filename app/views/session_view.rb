class SessionView
  def ask_for_username
  puts "what is your username?"
  puts "> "
  gets.chomp
  end

  def ask_for_password
  puts "what is your password?"
  puts "> "
  gets.chomp
  end

  def wrong_credentials
    puts "wrong username or password, try again!"
  end

  def sign_in_successfully(employee)
    puts "You are now signed in #{employee.username} as a #{employee.role}"
  end
end
