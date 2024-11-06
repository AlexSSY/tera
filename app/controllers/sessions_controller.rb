class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_by login_params

    if !!@user
      login @user
      redirect_to root_path
    else
      @user = User.new
      @user.errors.add(:email, "incorrect")
      @user.errors.add(:password, "incorrect")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to new_session_path
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
