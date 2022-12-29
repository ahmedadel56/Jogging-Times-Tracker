class User < ApplicationRecord
  has_many :jogging_times, dependent: :destroy
end
