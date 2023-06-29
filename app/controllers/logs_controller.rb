class LogsController < ApplicationController

  def index
    if current_user
      @pets = current_user.pets

      if params[:pet_id].present?
        @selected_pet = current_user.pets.find(params[:pet_id])
        @latest_logs = @selected_pet.logs.order(created_at: :desc).limit(1)
      end
    end
  end

  def new
    @pets = current_user.pets

    if params[:pet_id].present?
      @selected_pet = current_user.pets.find(params[:pet_id])
    end
    @log = Log.new
  end
  
  def create
    @pets = current_user.pets

    if params[:pet_id].present?
      @selected_pet = current_user.pets.find(params[:pet_id])
    end

    @log = Log.new(log_params)
    if @log.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(:toilet, :meal, :mood_id, :walktime, :bodytemperature, :weight, :length, :memo).merge(user_id: current_user.id, pet_id: @selected_pet.id )
  end
end
