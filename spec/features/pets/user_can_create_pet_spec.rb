require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can add pet" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")
                               
    visit "/shelters/#{shelter_1.id}/pets"
    click_link("Create Pet")
    
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets/new")

    fill_in 'name', with: 'Franco'
    fill_in 'description', with: 'A regal cat that will stare into your soul.'
    fill_in 'approximate_age', with: 7
    fill_in 'sex', with: 'male'
    fill_in 'image', with: 'https://cdn.shopify.com/s/files/1/1227/0278/files/tuxedocat_large.jpg?v=1556222045'
    click_button 'Create Pet'
    
    expect(page).to have_current_path("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content('Franco')
    expect(page).to have_content(7)
    expect(page).to have_content('male')
    expect(page).to have_content('adoptable')
    expect(page).to have_xpath("//img[@src='https://cdn.shopify.com/s/files/1/1227/0278/files/tuxedocat_large.jpg?v=1556222045']")
  end
end