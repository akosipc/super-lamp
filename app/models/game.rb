class Game < ActiveRecord::Base
  include Selectable 
  validates :name, :kind, presence: true
  validates :name, uniqueness: { scope: :kind }

  has_and_belongs_to_many :teams
end
