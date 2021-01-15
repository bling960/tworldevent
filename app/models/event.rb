class Event < ApplicationRecord
    has_one_attached :image

    has_many :user_ones
    has_many :user_twos
end
