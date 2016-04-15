class Match < ActiveRecord::Base

  validates :name, :starts_at, :ends_at, :end_date, :start_date, presence: true

  has_one :team_a, class_name: "Team", foreign_key: "team_a_id"
  has_one :team_b, class_name: "Team", foreign_key: "team_b_id"

end
