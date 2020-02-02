require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can see a shelter's available pets" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       description: "Cool guy",
                       status: "adoptable",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")

    visit "/shelters/#{shelter.id}/pets"

    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end