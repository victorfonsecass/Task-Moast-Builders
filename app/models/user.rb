class User < ApplicationRecord
  has_many :albums
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :authentication_keys => [:username]

  validates :username, uniqueness: true
  validates :fullname, presence: true
  validates :password, presence: true, length: { minimum: 6 }
end
