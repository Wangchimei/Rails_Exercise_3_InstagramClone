class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  layout 'coverpage', only: [:coverpage, :new, :create]

  def coverpage; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_path
      flash[:notice] = "登録が完了しました。もう一度ログインしてください。"
    else
      render :new
    end
  end

  def edit
    render layout: 'user'
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロファイルを更新しました"
      redirect_to user_path(@user.id) and return
      render layout: 'user'
    else
      render :edit
    end
  end

  def show
    render layout: 'user'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :avatar_cache)
  end
end
