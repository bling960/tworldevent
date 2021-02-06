class Setting < ApplicationRecord

    has_one_attached :image_background
    has_one_attached :image_content
end
