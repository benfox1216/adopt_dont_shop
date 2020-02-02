require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can see individual pet info" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       description: "Puff is a magic dragon that loves to take people on adventures",
                       approximate_age: 186,
                       sex: "male",
                       status: "adoptable",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")

    visit "/pets/#{pet_1.id}"

    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.description)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.status)
  end
end