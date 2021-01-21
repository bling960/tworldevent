require "administrate/base_dashboard"

class EventOneDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    event: Field::BelongsTo,

    image1: Field::String,
    image2: Field::String,
    image3: Field::String,
    image4: Field::String,
    image_apps: Field::String,
    image_steps: Field::String,
    image_background: Field::String,

    id: Field::Number,
    color: Field::String,
    text1: Field::String,
    text2: Field::Text,
    text3: Field::String,
    text4: Field::Text,
    text5: Field::Text,
    text6: Field::Text,
    caution1: Field::String,
    caution2: Field::Text,
    caution3: Field::String,
    caution4: Field::Text,

    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  id
  text1
  text2
  updated_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  event
  image1
  image2
  image3
  image4
  image_apps
  image_steps
  image_background
  id
  color
  text1
  text2
  text3
  text4
  text5
  text6
  caution1
  caution2
  caution3
  caution4
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  image1
  image2
  image3
  image4
  image_apps
  image_steps
  image_background
  color
  text1
  text2
  text3
  text4
  text5
  text6
  caution1
  caution2
  caution3
  caution4
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how event ones are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event_one)
  #   "EventOne ##{event_one.id}"
  # end
end
