class PostsController < ApplicationController
  
  def index
    if params[:ranking]
      @posts = Post.find(Favorite.group(:post_id).order('count(post_id) desc'). pluck(:post_id))
      #Favorite(いいねのレコード)を"post_id"(投稿ID)ごとにgroup分けを行う。
      #orderで"post_id"が多い順に並び替えを行う。
      #pluckでFavoriteのレコードから"post_id"カラムだけを取り出す。
    elsif params[:new]
      @posts = Post.all.order(created_at: "DESC")
      #"created_at"カラムを昇順(DESC)に並び替える。
    else
      @posts = Post.all.order(created_at: "DESC")
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:body, :before_image, :after_image)
  end

end
