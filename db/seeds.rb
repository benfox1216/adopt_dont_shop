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
                   image: "https://cdn.pixabay.com/photo/2015/07/09/19/32/dog-838281_960_720.jpg",
                   shelter_id: shelter_1.id)
Pet.create(name: "Jacqueline",
                   approximate_age: 7,
                   sex: "female",
                   status: "adoptable",
                   shelter: shelter_1.name,
                   image: "https://images.unsplash.com/photo-1568564321589-3e581d074f9b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80",
                   shelter_id: shelter_1.id)