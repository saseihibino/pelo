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

  def destroy
    log = Log.find(params[:id])
    if user_signed_in? && current_user.id = log.user.id
      log.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit 
    @pets = current_user.pets

    if params[:pet_id].present?
      @selected_pet = current_user.pets.find(params[:pet_id])
    end
    @log = Log.find(params[:id])
    return if current_user.id == @log.user.id
    redirect_to action: :index
  end

  def update
    @pets = current_user.pets

    if params[:pet_id].present?
      @selected_pet = current_user.pets.find(params[:pet_id])
    end

    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def toiletlog 
    @logs = Log.where(pet_id: params[:pet_id]).order(created_at: :desc)
    @pet = Pet.find(params[:pet_id])
  end

  def weightlog 
    @logs = Log.where(pet_id: params[:pet_id]).order(created_at: :desc)
    @pet = Pet.find(params[:pet_id])
  end

  def bodytemperaturelog 
    @logs = Log.where(pet_id: params[:pet_id]).order(created_at: :desc)
    @pet = Pet.find(params[:pet_id])
  end

  private

  def log_params
    params.require(:log).permit(:toilet, :meal, :mood_id, :walktime, :bodytemperature, :weight, :length, :memo).merge(user_id: current_user.id, pet_id: @selected_pet.id )
  end
end
