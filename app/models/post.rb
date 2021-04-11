class Post
  # TODO: Gather all code from all previous exercises
  # - reader and accessors
  # - initialize
  # - self.find
  # - self.all
  # - save
  # - destroy
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    if DB.execute("SELECT * FROM posts WHERE id LIKE ?", id.to_s) == []
      return nil
    else
      @id_array = DB.execute("SELECT * FROM posts WHERE id LIKE ?", id.to_s)
      @id_array.each do |i|
        @new_post = Post.new(id: i[0], title: i[1], url: i[2], votes: i[3])
      end
      @new_post
    end
  end

  def self.all
    result = DB.execute("SELECT * FROM posts")
    posts = []
    result.each do |i|
      posts << Post.new(id: i[0], title: i[1], url: i[2], votes: i[3])
    end
    return posts
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title) VALUES ('#{@url}', #{@votes}, '#{@title}')")
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET url = '#{@url}', votes = #{@votes}, title = '#{@title}' WHERE id = #{@id}")
    end
  end

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = #{@id}")
  end
end
