require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can visit shelters pets index from shelter show page" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       description: "Cool guy",
                       status: "adoptable",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")
    pet_2 = shelter.pets.create(name: "Jacqueline",
                       approximate_age: 7,
                       sex: "female",
                       description: "An awesome dog",
                       status: "adoptable",
                       image: "https://unsplash.com/photos/-XW35nYkRnk")

    visit "/shelters/#{shelter.id}"
    click_link("This Shelter's Pets")
    expect(page).to have_current_path("/shelters/#{shelter.id}/pets")
  end
end