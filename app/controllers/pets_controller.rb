class PetsController < ApplicationController

  def new 
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:petname, :birthday, :gender_id, :type, :memo).merge(user_id: current_user.id)
  end
end
