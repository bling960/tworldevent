class EventOne < ApplicationRecord
    belongs_to :event

    has_one_attached :image1
    has_one_attached :image2
    has_one_attached :image3
    has_one_attached :image4
    has_one_attached :image_apps
    has_one_attached :image_steps

end
