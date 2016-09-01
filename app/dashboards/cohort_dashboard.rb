require "administrate/base_dashboard"

class CohortDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    profiles: Field::HasMany,
    users: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    school_id: Field::Number,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :profiles,
    :users,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :profiles,
    :users,
    :id,
    :name,
    :school_id,
    :start_date,
    :end_date,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :profiles,
    :users,
    :name,
    :school_id,
    :start_date,
    :end_date,
  ].freeze

  # Overwrite this method to customize how cohorts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(cohort)
  #   "Cohort ##{cohort.id}"
  # end
end