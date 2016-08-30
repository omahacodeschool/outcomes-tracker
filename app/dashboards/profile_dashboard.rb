require "administrate/base_dashboard"

class ProfileDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    cohort: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    gender: Field::String,
    birthdate: Field::DateTime,
    race: Field::String,
    ethnicity: Field::String,
    military: Field::Boolean,
    disability: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :cohort,
    :user,
    :id,
    :gender,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :cohort,
    :user,
    :id,
    :gender,
    :birthdate,
    :race,
    :ethnicity,
    :military,
    :disability,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :cohort,
    :user,
    :gender,
    :birthdate,
    :race,
    :ethnicity,
    :military,
    :disability,
  ].freeze

  # Overwrite this method to customize how profiles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(profile)
  #   "Profile ##{profile.id}"
  # end
end
