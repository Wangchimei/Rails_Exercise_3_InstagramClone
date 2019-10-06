class SessionsController < ApplicationController
  layout 'coverpage'

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to feeds_path
      flash[:notice] = "ログインしました"
    else
      flash.now[:danger] = "メールアドレスまたはパスワードが違います"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_session_path
  end

end
