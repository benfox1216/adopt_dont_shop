require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can delete shelters from shelter index" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")
    shelter_2 = Shelter.create(name: "From Stray to Family",
                               address: "456 Field St",
                               city: "Philly",
                               state: "PA",
                               zip: "98765")

    visit "/shelters"

    expect(page).to have_link 'Delete', href: "/shelters/#{shelter_1.id}"
    expect(page).to have_link 'Delete', href: "/shelters/#{shelter_2.id}"

    id = shelter_1.id.to_s
    
    within('ul', :id => id) do
      click_link("Delete")
    end
    
    expect(page).to have_current_path("/shelters")
    expect(page).to have_no_content('Your Neighborhood Cats and Dogs')
    expect(page).to have_no_content('123 Lake St')
    expect(page).to have_no_content('Tulsa')
    expect(page).to have_no_content('OK')
    expect(page).to have_no_content('12345')
  end
end