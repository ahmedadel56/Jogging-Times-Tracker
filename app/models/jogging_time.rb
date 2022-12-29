class JoggingTime < ApplicationRecord
    belongs_to :user
    validates :minutes, :distance, :date, presence: true
    validates :minutes, :distance, length: { minimum: 1 }
end
