require "administrate/base_dashboard"

class LeadDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    tags: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    biz: Field::String,
    email: Field::String,
    position: Field::String,
    company: Field::String,
    connected_on: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :biz,
    :email,
    :position,
    :tags,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :tags,
    :id,
    :first_name,
    :last_name,
    :email,
    :position,
    :biz,
    :company,
    :connected_on,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :tags,
    :first_name,
    :last_name,
    :email,
    :position,
    :company,
    :connected_on,
  ].freeze

  # Overwrite this method to customize how leads are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(lead)
  #   "Lead ##{lead.id}"
  # end
end
