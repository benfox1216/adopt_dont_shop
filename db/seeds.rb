Pet.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                           address: "123 Lake St",
                           city: "Tulsa",
                           state: "OK",
                           zip: "12345")
Pet.create(name: "Puff",
                   approximate_age: 186,
                   sex: "male",
                   status: "adoptable",
                   shelter: shelter_1.name,
                   image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/",
                   shelter_id: shelter_1.id)
Pet.create(name: "Jacqueline",
                   approximate_age: 7,
                   sex: "female",
                   status: "adoptable",
                   shelter: shelter_1.name,
                   image: "https://unsplash.com/photos/-XW35nYkRnk",
                   shelter_id: shelter_1.id)