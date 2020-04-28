class UsersController < ApplicationController
  before_action :authenticate_user! , only:[:edit, :update]

  #片付けマスターランキング機能(ユーザごとに投稿のいいね総数でランキング)
  def ranking 

    #ランキングのユーザ情報を表示
      #INNERJOIN[posts,favoritesテーブルを結合]
      #GROUPBY[postsテーブルのuser_idごとにレコードを分ける]
      #ORDER[COUNT[favorites.idでカウント]レコードを降順で並び替え]
      #pluck[postsテーブルのuser_idを取り出す]
    @users = 
      User.find(User.joins(posts: :favorites)
        .select('users.*, posts.*, favorites.*')
        .group('posts.user_id')
        .order('count(favorites.id) desc')
        .pluck('posts.user_id')
        )

    #ユーザごとのいいね総数を表示
      #INNERJOIN[posts,favoritesテーブルを結合]
      #SELECT[favoritesテーブルまで結合したすべてのレコードを取得]
      #GROUPBY[postsテーブルのuser_idごとにレコードを分ける]
      #ORDER[COUNT[favorites.idでカウント]レコードを降順で並び替え]
      #COUNT[postsテーブルのuser_idをカウント]values[VALUEだけを取り出す]
    @favorites = 
      User.joins(posts: :favorites)
      .select('users.*, posts.*, favorites.*')
      .group('posts.user_id')
      .order('count(favorites.id) desc')
      .count('posts.user_id').values

  end

  def show
    @user = User.find(params[:id])
    @posts = 
      Post.where(user_id: @user.id)
      .order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を更新しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
    user = User.find(params[:id])
    @users = user.following
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :body, :email, :profile_image)
  end
end
