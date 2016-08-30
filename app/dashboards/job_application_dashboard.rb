require "administrate/base_dashboard"

class JobApplicationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    entry: Field::BelongsTo,
    id: Field::Number,
    location: Field::String,
    job_title: Field::String,
    remote: Field::Boolean,
    posting_url: Field::String,
    company_contact: Field::String,
    notes: Field::Text,
    date_due: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    nature_of_employment: Field::String.with_options(searchable: false),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :entry,
    :id,
    :location,
    :job_title,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :entry,
    :id,
    :location,
    :job_title,
    :remote,
    :posting_url,
    :company_contact,
    :notes,
    :date_due,
    :created_at,
    :updated_at,
    :nature_of_employment,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :entry,
    :location,
    :job_title,
    :remote,
    :posting_url,
    :company_contact,
    :notes,
    :date_due,
    :nature_of_employment,
  ].freeze

  # Overwrite this method to customize how job applications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(job_application)
  #   "JobApplication ##{job_application.id}"
  # end
end
