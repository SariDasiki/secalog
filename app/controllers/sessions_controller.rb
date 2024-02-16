class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :correct_user, only: [:show]

    def new
      @user = User.new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user&& user.authenticate(params[:session][:password_digest])
        log_in(user)
        flash[:notice] = "ログインしました"
        redirect_to tasks_path
      else 
        flash.now[:danger] = 'メールアドレスまたはパスワードに誤りがあります'
        render :new
    end
    end

    def destroy
      session.delete(:user_id)
      flash[:notice] = 'ログアウトしました'
      redirect_to new_session_path
  end
  
end
