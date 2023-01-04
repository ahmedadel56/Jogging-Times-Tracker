class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jogging_times, dependent: :destroy
  validates :name, :email, presence: true, length: { minimum: 3, maximum: 250 }
end
