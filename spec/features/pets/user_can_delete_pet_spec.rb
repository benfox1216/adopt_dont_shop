require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can delete pet" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       description: "Cool guy",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                       status: "adoptable")

    visit "/pets/#{pet_1.id}"
    click_link("Delete")

    expect(page).to have_current_path("/pets")
    expect(page).to have_no_content('Puff')
    expect(page).to have_no_content(186)
    expect(page).to have_no_content('male')
    expect(page).to have_no_content('Fun Time Adoptions')
    expect(page).not_to have_xpath("//img[src='https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/']")
  end
end