class LogsController < ApplicationController

  def index
    if current_user
      @pets = current_user.pets

      if params[:pet_id].present?
        @selected_pet = current_user.pets.find(params[:pet_id])
      end
    end
  end

  def new
    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.save?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(:toilet, :meal, :mood, :walktime, :bodytemperature, :weight, :length, :memo).merge(user_id: current_user.id, pet_id: @selected_pet.id)
  end
end
