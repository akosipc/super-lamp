class Game < ActiveRecord::Base
  validates :name, :kind, presence: true
end
