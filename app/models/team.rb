class Team < ActiveRecord::Base
  validates :name, :description, :logo, :country, presence: true
  validates :description, length: { within: 60..500 }
  validates :name, uniqueness: true
end
