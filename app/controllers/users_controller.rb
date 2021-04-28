class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = 'Welcome to Olympics Articles'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
