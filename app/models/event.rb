class Event < ActiveRecord::Base
  
  validates :name, :description, :starts_at, :ends_at, :start_date, :end_date, presence: true

  has_many :matches

end
