require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can delete pets from pet index pages" do
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

    expect(page).to have_link 'Delete', href: "/pets/#{pet_1.id}"
    expect(page).to have_link 'Delete', href: "/pets/#{pet_2.id}"

    id = pet_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Delete")
    end
    
    expect(page).to have_current_path("/pets")
    expect(page).to have_no_content('123 Lake St')
    expect(page).to have_no_content('Tulsa')
    expect(page).to have_no_content('OK')
    expect(page).to have_no_content('12345')
    
    pet_1 = shelter.pets.create(name: "Puff",
                                approximate_age: 186,
                                sex: "male",
                                description: "Cool guy",
                                status: "adoptable",
                                image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")
    
    visit "/shelters/#{shelter.id}/pets"
    
    expect(page).to have_link 'Delete', href: "/shelters/#{shelter.id}/pets/#{pet_1.id}"
    expect(page).to have_link 'Delete', href: "/shelters/#{shelter.id}/pets/#{pet_2.id}"
    
    id = pet_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Delete")
    end
    
    expect(page).to have_current_path("/shelters/#{shelter.id}/pets")
  end
end