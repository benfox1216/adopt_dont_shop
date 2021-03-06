class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end
  
  def show
    @pet = Pet.find(params[:id])
  end
  
  def edit
    @pet = Pet.find(params[:id])
  end
  
  def update
    pet = Pet.find(params[:id])
    pet.update({
      name: params[:name],
      description: params[:description],
      approximate_age: params[:approximate_age],
      sex: params[:sex],
      image: params[:image]
      })
      
    redirect_to "/pets/#{pet.id}"
  end
  
  def destroy
    Pet.destroy(params[:id])
    redirect_to '/pets'
  end
end