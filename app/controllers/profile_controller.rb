class ProfileController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes params.require(:user).permit(:time_zone, :language)
      redirect_to profile_edit_path, flash: {success: "Saved"}
    else
      redirect_to profile_edit_path, flash: {error: "Error: #{@user.errors.full_messages.to_sentence}"}
    end
  end
end
