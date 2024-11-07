class RegistersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new register_params

    if @user.save
      login @user
      redirect_to root_path, notice: "You are registered successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def register_params
    params.require(:user).permit(:email, :password, :password_confirmation).with_defaults(password_confirmation: "")
  end
end
