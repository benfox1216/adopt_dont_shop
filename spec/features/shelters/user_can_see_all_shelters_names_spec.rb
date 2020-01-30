require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
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
    
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end