class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :description
      t.integer :approximate_age
      t.string :sex
      t.string :status
      t.string :shelter
      t.string :image
      t.string :shelter_id
    end
  end
end
