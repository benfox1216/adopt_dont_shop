Pet.destroy_all
Shelter.destroy_all

shelter = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                           address: "123 Lake St",
                           city: "Tulsa",
                           state: "OK",
                           zip: "12345")
                           binding.pry
shelter.pets.create(name: "Puff",
                    approximate_age: 186,
                    sex: "male",
                    description: "Cool guy",
                    status: "adoptable",
                    image: "https://pixabay.com/photos/dog-view-sweet-animal-portrait-838281/")
shelter.pets.create(name: "Jacqueline",
                    approximate_age: 7,
                    sex: "female",
                    description: "An awesome dog",
                    status: "adoptable",
                    image: "https://unsplash.com/photos/-XW35nYkRnk")