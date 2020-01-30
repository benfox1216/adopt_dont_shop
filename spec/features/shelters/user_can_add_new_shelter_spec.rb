require 'rails_helper'

RSpec.describe "add shelter", type: :feature do
  it "can add shelter" do
    visit "/shelters"
    expect(page).to have_link 'New Shelter'
    
    click_link("New Shelter")
    expect(page).to have_current_path('/shelters/new')
    expect(page).to have_field 'name'
    expect(page).to have_field 'address'
    expect(page).to have_field 'city'
    expect(page).to have_field 'state'
    expect(page).to have_field 'zip'
    expect(page).to have_button 'Create Shelter'
    
    fill_in 'name', with: 'Your Neighborhood Cats and Dogs'
    fill_in 'address', with: '123 Lake St'
    fill_in 'city', with: 'Tulsa'
    fill_in 'state', with: 'OK'
    fill_in 'zip', with: '12345'
    click_button 'Create Shelter'
    save_and_open_page
    expect(page).to have_current_path('/shelters')
    expect(page).to have_content('Your Neighborhood Cats and Dogs')
    expect(page).to have_content('123 Lake St')
    expect(page).to have_content('Tulsa')
    expect(page).to have_content('OK')
    expect(page).to have_content('12345')
  end
end