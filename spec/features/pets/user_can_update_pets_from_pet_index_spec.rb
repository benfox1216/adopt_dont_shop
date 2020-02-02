require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can update pets from pet index" do
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

    visit "/pets"

    expect(page).to have_link 'Edit', href: "/pets/#{pet_1.id}/edit"
    expect(page).to have_link 'Edit', href: "/pets/#{pet_2.id}/edit"

    id = pet_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Edit")
    end
    
    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
    
    visit "/shelters/#{shelter.id}/pets"
    
    expect(page).to have_link 'Edit', href: "/pets/#{pet_1.id}/edit"
    expect(page).to have_link 'Edit', href: "/pets/#{pet_2.id}/edit"
    
    within('ul', :id => id) do
      click_link("Edit")
    end
    
    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
  end
end