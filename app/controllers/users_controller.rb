class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  skip_before_action :login_required, only: [:coverpage]
  layout 'coverpage', only: [:coverpage, :new, :create]

  def coverpage;end

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
    unless @user == current_user
      flash[:error] = "権限がありません"
      redirect_to user_path(current_user) and return
    end
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
    unless current_user == @user
      flash[:error] = "権限がありません"
      redirect_to user_path(current_user) and return
    end
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
