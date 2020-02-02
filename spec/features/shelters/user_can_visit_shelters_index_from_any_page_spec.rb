require 'rails_helper'

RSpec.describe "user can", type: :feature do
  it "go to pet show page from anywhere" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")
    pet_1 = Pet.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       shelter: shelter_1.name,
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                       shelter_id: shelter_1.id)
    pet_2 = Pet.create(name: "Jacqueline",
                       approximate_age: 7,
                       sex: "female",
                       shelter: shelter_1.name,
                       image: "https://unsplash.com/photos/-XW35nYkRnk",
                       shelter_id: shelter_1.id)
    
    visit "/"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/pets"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/pets/#{pet_1.id}"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/shelters/#{shelter_1.id}"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
    
    visit "/shelters/#{shelter_1.id}/pets"
    click_link("Shelters")
    expect(page).to have_current_path("/shelters")
  end
end