class UsersController < ApplicationController
  before_action :require_current_user, except: [:new, :create]

  def show

  end

  def new
    @user = User.new

    render :layout=>false
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Successful Account Creation"
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end