require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can update shelter info" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")

    visit "/shelters/#{shelter_1.id}"
    click_link("Update Shelter")
    
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/edit")
    
    fill_in 'name', with: 'Another Shelter'
    fill_in 'address', with: '456 Pond Ave'
    fill_in 'city', with: 'West Chester'
    fill_in 'state', with: 'PA'
    fill_in 'zip', with: '98765'
    click_button 'Update'
    
    expect(page).to have_current_path("/shelters/#{shelter_1.id}")
    expect(page).to have_content('Another Shelter')
    expect(page).to have_content('456 Pond Ave')
    expect(page).to have_content('West Chester')
    expect(page).to have_content('PA')
    expect(page).to have_content('98765')
    
    expect(page).to have_no_content('Your Neighborhood Cats and Dogs')
    expect(page).to have_no_content('123 Lake St')
    expect(page).to have_no_content('Tulsa')
    expect(page).to have_no_content('OK')
    expect(page).to have_no_content('12345')
  end
end