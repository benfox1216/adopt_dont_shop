require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can update shelters from shelter index" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")
    shelter_2 = Shelter.create(name: "From Stray to Family",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")

    visit "/shelters"

    expect(page).to have_link 'Edit', href: "/shelters/#{shelter_1.id}/edit"
    expect(page).to have_link 'Edit', href: "/shelters/#{shelter_2.id}/edit"

    id = shelter_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Edit")
    end
    
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
  end
end