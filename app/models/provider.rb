class Provider < ActiveRecord::Base
  validates :uid, :token, :name, presence: true
  validates :uid, uniqueness: { scope: :name }

  belongs_to :user
end
