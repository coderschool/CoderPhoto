class ProfileController < ApplicationController
  def edit
  end

  def update
    @user = current_user

    if @user.update_attributes user_params
      redirect_to photos_path, flash: {success: t('.updated_profile')}
    else
      redirect_to profile_edit_path, flash: {error: "Error: #{@user.errors.full_messages.to_sentence}"}
    end
  end

  private
  def user_params
    params.require(:user).permit(:locale, :time_zone)
  end
end
