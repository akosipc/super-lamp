class Game < ActiveRecord::Base
  validates :name, :kind, presence: true
  validates :name, uniqueness: { scope: :kind }
end
