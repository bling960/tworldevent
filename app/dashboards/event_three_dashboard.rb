require "administrate/base_dashboard"

class EventThreeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    event: Field::BelongsTo,

    image_logo: Field::String,
    image_headline: Field::String,
    image_main: Field::String,
    image_content: Field::String,
    image_option1: Field::String,
    image_option2: Field::String,
    image_option3: Field::String,
    image_option4: Field::String,
    image_option5: Field::String,
    image_thanks: Field::String,

    id: Field::Number,
    color: Field::String,
    text1: Field::Text,
    text2: Field::Text,
    text3_headline: Field::String,
    text3: Field::Text,
    text4_headline: Field::String,
    text4: Field::Text,
    text5: Field::Text,
    text6: Field::Text,
    text7: Field::Text,
    option1: Field::Text,
    option2: Field::Text,
    option3: Field::Text,
    option4: Field::Text,
    option5: Field::Text,

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
  color

  image_logo
  image_headline
  image_main
  image_content
  image_option1
  image_option2
  image_option3
  image_option4
  image_option5
  image_thanks

  text1
  text2
  text3_headline
  text3
  text4_headline
  text4
  text5
  text6
  text7

  option1
  option2
  option3
  option4
  option5

  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  color
  image_logo
  image_headline
  image_main
  image_content
  image_option1
  image_option2
  image_option3
  image_option4
  image_option5
  image_thanks
  text1
  text2
  text3_headline
  text3
  text4_headline
  text4
  text5
  text6
  text7

  option1
  option2
  option3
  option4
  option5
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

  # Overwrite this method to customize how event threes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(event_three)
  #   "EventThree ##{event_three.id}"
  # end
end
