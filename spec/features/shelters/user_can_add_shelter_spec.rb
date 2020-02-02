require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can add shelter" do
    visit "/shelters"
    click_link("New Shelter")
    
    expect(page).to have_current_path('/shelters/new')

    fill_in 'name', with: 'Your Neighborhood Cats and Dogs'
    fill_in 'address', with: '123 Lake St'
    fill_in 'city', with: 'Tulsa'
    fill_in 'state', with: 'OK'
    fill_in 'zip', with: '12345'
    click_button 'Create Shelter'
    
    expect(page).to have_current_path('/shelters')
    expect(page).to have_content('Your Neighborhood Cats and Dogs')
    expect(page).to have_content('123 Lake St')
    expect(page).to have_content('Tulsa')
    expect(page).to have_content('OK')
    expect(page).to have_content('12345')
  end
end