class PostsController < ApplicationController
  before_action :authenticate_user! , only:[:new, :create, :edit, :update]
  
  def index

    #いいねが多い順に表示させる機能。(人気)
    if params[:ranking]
      #GROUPBY[Favoriteモデルをuser_idごとに分ける]
      #ORDER[COUNT[post_idでカウント]レコードを降順で並び替え]
      #puluck[post_idを取り出す]
      @posts = 
        Post.find(Favorite.group(:post_id)
          .order("count(post_id) desc")
          .pluck(:post_id)
          )

    #新しい投稿順で表示させる機能。(新着)
    elsif params[:new]
      #ORDER[レコードのcreated_atを降順で並び替え]
      @posts = 
        Post.all
          .order("created_at DESC")

    #フォローしているユーザの投稿のみを表示させる機能。(タイムライン)
    else
      user = User.find(current_user.id)
      following_users = user.following
      #where[Postモデルからフォロー中ユーザのレコードを取り出す]
      #ORDER[レコードのcreated_atを降順で並び替え]
      @posts = 
        Post.where(user_id: following_users)
          .order("created_at DESC")
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
    if current_user.admin != true
      if @post.user != current_user
        redirect_to user_path(current_user.id)
      end
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


 