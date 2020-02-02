require 'rails_helper'

RSpec.describe "user", type: :feature do
  it "can see all pets info" do
    shelter = Shelter.last
    pet_1 = shelter.pets.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       status: "adoptable",
                       description: "Cool guy",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")
    pet_2 = shelter.pets.create(name: "Jacqueline",
                       approximate_age: 7,
                       sex: "female",
                       description: "An awesome dog",
                       status: "adoptable",
                       image: "https://unsplash.com/photos/-XW35nYkRnk")
    
    visit "/pets"

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter.name)
    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(pet_2.shelter.name)
    expect(page).to have_xpath("//img[@src='#{pet_2.image}']")
  end
end