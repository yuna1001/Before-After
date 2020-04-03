class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(current_user.id)
    else
      render :new
    end
  end

  def edit
  end

  private
  def post_params
    params.require(:post).permit(:body, :before_image, :after_image )
  end

end
