class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def edit_password
  end

  def update_password
    if current_user.update update_password_params
      redirect_to root_path
    else
      render :edit_password, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update update_prams
      redirect_to root_path
    else
      debugger
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def update_prams
    params.require(:user).permit(
        :email,
        :first_name,
        :last_name,
        :phone_number,
        :address,
        :avatar
      )
  end

  def update_password_params
    params.require(:user).permit(:password, :password_confirmation, :password_challenge)
      .with_defaults(password_confirmation: "", password_challenge: "")
  end
end
