class PostsController < ApplicationController
  before_action :authenticate_user! , only:[:new, :create, :edit, :update]
  
  def index
    if params[:ranking]
      @posts = Post.find(Favorite.group(:post_id).order("count(post_id) desc"). pluck(:post_id))
      #いいねが多い順に表示させる機能。(人気)
      #Favorite(いいね)のレコードを"post_id"(投稿id)ごとにgroup分けを行う。
      #orderで"post_id"が多い順に並び替えを行う。
      #pluckで複数のレコードから"post_id"のidだけを取り出す。
    elsif params[:new]
      @posts = Post.all.order("created_at DESC")
      #新しい投稿順で表示させる機能。(新着)
      #Postレコードの"created_at"カラムを昇順(DESC)に並び替える。
    else
      user = User.find(current_user.id)
      following_users = user.following
      @posts = Post.where(user_id: following_users).order("created_at DESC")
      #フォローしているユーザの投稿のみを表示させる機能。(タイムライン)
      #Postレコードの"user_id"カラムからfollowing_users(フォロー中ユーザ)の投稿だけを取り出し、昇順(DESC)に並び替える。
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(@post.user.id)
  end

  private
  def post_params
    params.require(:post).permit(:body, :before_image, :after_image)
  end

end
