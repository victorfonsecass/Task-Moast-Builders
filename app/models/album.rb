class Album < ApplicationRecord
  belongs_to :user
  has_many :artists

   # belongs_to :artist

  validates :album_name, :year, presence: true
end
