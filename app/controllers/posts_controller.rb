require_relative '../models/post'
require_relative '../views/posts_view'
class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    @view.display(Post.all)
  end

  def create
    new_post_title = @view.title
    new_post_url = @view.url
    @post = Post.new(title: new_post_title, url: new_post_url)
    @post.save
  end

  def update
    index
    @found_post = Post.find(@view.select_id)
    new_title = @view.update_title
    new_url = @view.update_url
    @found_post.title = new_title
    @found_post.save
    @found_post.url = new_url
    @found_post.save
    index
  end

  def destroy
    index
    @found_post = Post.find(@view.select_id)
    @found_post.destroy
    index
  end

  def upvote
    index
    id = @view.select_id
    post = Post.find(id)
    post.votes += 1
    post.save
    index
  end
end
