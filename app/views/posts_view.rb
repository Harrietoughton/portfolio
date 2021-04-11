class PostsView
  # TODO: implement methods called by the PostsController
  def title
    puts "What is the title of your post?"
    puts ">"
    gets.chomp
  end

  def url
    puts "What is the url of your post?"
    puts ">"
    gets.chomp
  end

  def display(posts)
    puts " "
    posts.each do |post|
      puts "#{post.id}, #{post.title}, #{post.url}, #{post.votes}"
    end
    puts " "
  end

  def select_id
    puts "which post ID would you like to select?"
    puts "> "
    gets.chomp.to_i
  end

  def update_title
    puts "What would you like the title to be?"
    puts "> "
    gets.chomp
  end

  def update_url
    puts "What would you like the url to be?"
    puts "> "
    gets.chomp
  end
end
