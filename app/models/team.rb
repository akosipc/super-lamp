class Team < ActiveRecord::Base
  include Selectable

  validates :name, :description, :logo, :country, presence: true
  validates :description, length: { minimum: 60 }
  validates :name, uniqueness: true

  has_and_belongs_to_many :games
end
