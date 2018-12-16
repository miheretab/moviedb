class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "User was successfully registered.."
      redirect_to login_url
    else
      flash.now[:error] = "User couldn't be registered"
      render action: "new"
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
