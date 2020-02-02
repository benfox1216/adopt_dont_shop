require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can visit shelters index from any page" do
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
    
    visit "/"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/pets"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/pets/#{pet_1.id}"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/shelters/#{shelter.id}"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/shelters/#{shelter.id}/pets"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
  end
end