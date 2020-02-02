class SheltersPetsController < ApplicationController
  def index
    @shelter_name = Shelter.find(params[:shelter_id]).name
    @shelter_id = params[:shelter_id]
    @shelters_pets = Pet.all.find_all do |pet|
      pet.shelter_id == @shelter_id
    end
  end
  
  def new
    @shelter_id = params[:shelter_id]
  end
  
  def create
    params[:status] = "adoptable"
    
    shelter = Shelter.find(params[:shelter_id])
    shelter.pets.create(shelters_pets_params)
    redirect_to "/shelters/#{shelter.id}/pets"
  end
  
  def destroy
    @shelter_id = params[:shelter_id]
    Pet.destroy(params[:pet_id])
    redirect_to "/shelters/#{@shelter_id}/pets"
  end
  
  private
  def shelters_pets_params
    params.permit(:name, :approximate_age, :sex, :image, :status, :description)
  end
end