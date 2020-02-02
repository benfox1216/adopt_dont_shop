require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can see a shelter's available pets" do
    shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                               address: "123 Lake St",
                               city: "Tulsa",
                               state: "OK",
                               zip: "12345")
    pet_1 = Pet.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       shelter: shelter_1.name,
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                       shelter_id: shelter_1.id)
    pet_2 = Pet.create(name: "Jacqueline",
                       approximate_age: 7,
                       sex: "female",
                       shelter: "Adoptions For All",
                       image: "https://unsplash.com/photos/-XW35nYkRnk",
                       shelter_id: "1")

    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
  end
end