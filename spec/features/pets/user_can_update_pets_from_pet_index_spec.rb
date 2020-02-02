require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can update pets from pet index" do
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
                       shelter: "Adoptions For All",
                       image: "https://unsplash.com/photos/-XW35nYkRnk",
                       shelter_id: shelter_1.id)

    visit "/pets"

    expect(page).to have_link 'Edit', href: "/pets/#{pet_1.id}/edit"
    expect(page).to have_link 'Edit', href: "/pets/#{pet_2.id}/edit"

    id = pet_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Edit")
    end
    
    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
    
    visit "/shelters/#{shelter_1.id}/pets"
    
    expect(page).to have_link 'Edit', href: "/pets/#{pet_1.id}/edit"
    expect(page).to have_link 'Edit', href: "/pets/#{pet_2.id}/edit"
    
    within('ul', :id => id) do
      click_link("Edit")
    end
    
    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")
  end
end