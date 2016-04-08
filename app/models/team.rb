class Team < ActiveRecord::Base
  validates :name, :description, :logo, :country, presence: true
  validates :description, length: { minimum: 60 }
  validates :name, uniqueness: true
end
