Pet.destroy_all
Shelter.destroy_all

shelter = Shelter.create(name: "Your Neighborhood Cats and Dogs",
                           address: "123 Lake St",
                           city: "Tulsa",
                           state: "OK",
                           zip: "12345")
shelter.pets.create(name: "Puff",
                    approximate_age: 186,
                    sex: "male",
                    description: "Cool guy",
                    status: "adoptable",
                    image: "https://townsquare.media/site/442/files/2016/12/puff-the-magic-dragon.jpg?w=980&q=75")
shelter.pets.create(name: "Grumpy Cat",
                    approximate_age: 7,
                    sex: "female",
                    description: "RIP Grumpy Cat",
                    status: "adoptable",
                    image: "https://sadanduseless.b-cdn.net/wp-content/uploads/2014/06/funny-cat7.jpg")