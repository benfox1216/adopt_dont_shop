require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets info" do
    pet_1 = Pet.create(name: "Puff",
                       approximate_age: 186,
                       sex: "male",
                       shelter: "Fun Time Adoptions",
                       image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                       shelter_id: 2)
    pet_2 = Pet.create(name: "Jacqueline",
                       approximate_age: 7,
                       sex: "female",
                       shelter: "Adoptions For All",
                       image: "https://unsplash.com/photos/-XW35nYkRnk",
                       shelter_id: 2)
    
    visit "/pets"
    
    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.approximate_age)
    expect(page).to have_content(pet_1.sex)
    expect(page).to have_content(pet_1.shelter)
    expect(page).to have_xpath("//img[@src='#{pet_1.image}']")
    
    expect(page).to have_content(pet_2.name)
    expect(page).to have_content(pet_2.approximate_age)
    expect(page).to have_content(pet_2.sex)
    expect(page).to have_content(pet_2.shelter)
    expect(page).to have_xpath("//img[@src='#{pet_2.image}']")
  end
end