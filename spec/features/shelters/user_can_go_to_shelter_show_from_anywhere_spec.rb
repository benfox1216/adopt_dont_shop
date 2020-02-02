require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can go to shelter show page from anywhere" do
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

    visit "/shelters"
    click_link("#{shelter.name}")
    expect(page).to have_current_path("/shelters/#{shelter.id}")
    
    visit "/shelters/#{shelter.id}/pets"
    id = pet_1.id.to_s
    within('ul', :id => id) do
      click_link("#{shelter.name}")
    end
    expect(page).to have_current_path("/shelters/#{shelter.id}")
    
    visit "/pets"
    within('ul', :id => id) do
      click_link("#{shelter.name}")
    end
    expect(page).to have_current_path("/shelters/#{shelter.id}")
    
    visit "/pets/#{pet_1.id}"
    click_link("#{shelter.name}")
    expect(page).to have_current_path("/shelters/#{shelter.id}")
  end
end