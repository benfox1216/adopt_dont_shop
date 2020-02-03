require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can visit pets index from any page" do
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
    click_link("Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters"
    click_link("Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters/#{shelter.id}"
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters/#{shelter.id}/pets"
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/pets/#{pet_1.id}"
    click_link("All Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters/#{shelter.id}/pets/new"
    click_link("Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/pets/#{pet_1.id}/edit"
    click_link("Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters/new"
    click_link("Pets")
    expect(page).to have_current_path("/pets")
    
    visit "/shelters/#{shelter.id}/edit"
    click_link("Pets")
    expect(page).to have_current_path("/pets")
  end
end