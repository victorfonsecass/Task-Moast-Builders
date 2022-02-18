class Album < ApplicationRecord
  belongs_to :user
  has_many :artists

  validates :album_name, :year, presence: true
end
