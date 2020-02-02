require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can delete shelter" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")

    visit "/shelters/#{shelter_1.id}"
    click_link("Delete Shelter")

    expect(page).to have_current_path("/shelters")
    expect(page).to have_no_content('Your Neighborhood Cats and Dogs')
    expect(page).to have_no_content('123 Lake St')
    expect(page).to have_no_content('Tulsa')
    expect(page).to have_no_content('OK')
    expect(page).to have_no_content('12345')
  end
end