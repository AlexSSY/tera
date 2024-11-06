class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update update_prams
      redirect_to root_path
    else
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
        :address
      )
  end
end
