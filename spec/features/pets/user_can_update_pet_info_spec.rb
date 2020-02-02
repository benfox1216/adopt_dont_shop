require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can update pet info" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       description: "Puff is a magic dragon that loves to take people on adventures",
                       approximate_age: 186,
                       sex: "female",
                       status: "adoptable",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")

    visit "/pets/#{pet_1.id}"
    click_link("Edit")

    expect(page).to have_current_path("/pets/#{pet_1.id}/edit")

    fill_in 'name', with: 'Franco'
    fill_in 'description', with: 'A regal cat that will stare into your soul.'
    fill_in 'approximate_age', with: 7
    fill_in 'sex', with: 'male'
    fill_in 'image', with: 'https://cdn.shopify.com/s/files/1/1227/0278/files/tuxedocat_large.jpg?v=1556222045'
    click_button 'Update'

    expect(page).to have_current_path("/pets/#{pet_1.id}")
    expect(page).to have_content('Franco')
    expect(page).to have_content(7)
    expect(page).to have_content('male')
    expect(page).to have_content('adoptable')
    expect(page).to have_xpath("//img[@src='https://cdn.shopify.com/s/files/1/1227/0278/files/tuxedocat_large.jpg?v=1556222045']")
    
    expect(page).to have_no_content('Puff')
    expect(page).to have_no_content('Puff is a magic dragon that loves to take people on adventures')
    expect(page).to have_no_content(186)
    expect(page).to have_no_content('female')
    expect(page).not_to have_xpath("//img[src='https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/']")
  end
end