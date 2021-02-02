class EventThree < ApplicationRecord
    belongs_to :event

    has_one_attached :image_logo
    has_one_attached :image_headline
    has_one_attached :image_main
    has_one_attached :image_content
    has_one_attached :image_option1
    has_one_attached :image_option2
    has_one_attached :image_option3
    has_one_attached :image_option4
    has_one_attached :image_option5
    has_one_attached :image_thanks

    has_one_attached :image_background
end
