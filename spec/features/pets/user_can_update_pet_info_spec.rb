require 'rails_helper'

RSpec.describe "user can", type: :feature do
  it "update pet info" do
    pet_1 = Pet.create(name: "Puff",
                       description: "Puff is a magic dragon that loves to take people on adventures",
                       approximate_age: 186,
                       sex: "female",
                       status: "adoptable",
                       shelter: "Awesome Shelter",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                       shelter_id: "1")

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