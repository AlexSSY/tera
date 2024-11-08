class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_by login_params

    if !!@user
      login @user
      redirect_to root_path, notice: "You are logged in successfully."
    else
      @user = User.new
      @user.errors.add(:email, "incorrect email")
      @user.errors.add(:password, "incorrect password")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to new_session_path, notice: "You are logged out successfully."
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
