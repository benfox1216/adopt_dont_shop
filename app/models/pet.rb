class Pet < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :approximate_age
  validates_presence_of :sex
  validates_presence_of :description
  validates_presence_of :status
  validates_presence_of :image
  
  belongs_to :shelter
  
  def self.shelters_pets_count
    count
  end
end