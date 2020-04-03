class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
    @before = BeforeImage.new
    @after = AfterImage.new
  end

  def edit
  end
end
