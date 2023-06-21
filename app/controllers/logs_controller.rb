class LogsController < ApplicationController

  def index
    if current_user
      @pets = current_user.pets

      if params[:pet_id].present?
        @selected_pet = current_user.pets.find(params[:pet_id])
      end
    end
  end
end
