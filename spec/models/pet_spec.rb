require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :approximate_age}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :description}
    it {should validate_presence_of :status}
    it {should validate_presence_of :image}
  end
  
  describe "relationships" do
    it {should belong_to :shelter}
  end
  
  describe "methods" do
    it "shelters_pets_count" do
      shelter = Shelter.last
      shelter.pets.create(name: "Puff",
                         approximate_age: 186,
                         sex: "male",
                         description: "Cool guy",
                         image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                         status: "adoptable")
      shelter.pets.create(name: "Jacqueline",
                         approximate_age: 7,
                         sex: "female",
                         description: "An awesome dog",
                         status: "adoptable",
                         image: "https://unsplash.com/photos/-XW35nYkRnk")
                         
      expect(shelter.pets.shelters_pets_count).to eq(2)
    end
  end
end