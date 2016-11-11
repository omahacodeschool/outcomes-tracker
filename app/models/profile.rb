class Profile < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user

  # delegate :cohort, :to => :user

  # Validate these on update, so that new user creation doesn't fail.
  validates :resume, presence: true, on: :update
  validates :resume, format: { with: URI.regexp }, on: :update

  validates :linked_in, presence: true, on: :update
  validates :linked_in, format: { with: URI.regexp }, on: :update

  validates :personal_website, presence: true, on: :update
  validates :personal_website, format: { with: URI.regexp }, on: :update

  validates :twitter, format: { with: /\A(-|\w)*\z/i }, on: :update

  enum gender_ndol: {"Female" => 0, "Male" => 1, "Unknown" => 2, "Not collected" => 3}

  enum race_ndol: {"American Indian or Alaska Native" => 1, "Asian" => 2, 
                  "Black or African American" => 3, "Native Hawaiian or Other Pacific Islander" => 4, 
                  "White" => 5, "Two or more races" => 6, "Unknown" => 7, "Not collected" => 8}

  enum ethnicity_ndol: {"Hispanic or Latino" => 0, "Not Hispanic or Latino" => 1, "Unknown" => 3, 
                        "Not Collected" => 4}
                        
  enum military_ndol: {"Yes" => 0, "No" => 1, "Unknown" => 2, "Not Collected" => 3}
  enum disability_ndol: {"Yes" => 0, "No" => 1, "Unknown" => 2, "Not Collected" => 3}
  enum first_generation_ndol: {"Yes" => 0, "No" => 1, "Unknown" => 2, "Not Collected" => 3}

  # How enums will need to be converted for the eventual NDOL spreadsheet
  # GENDER: 0 => "F", 1 => "M", 2 => "U", 3 => "X"
  # RACE: all the same except 7 => "U", 8 => "X"
  # ETHNICITY: 0 => "Y", 1 => "N", 2 => "U", 3 => "X"
  # MILITARY: 0 => "Y", 1 => "N", 2 => "U", 3 => "X
  # DISABILITY: 0 => "Y", 1 => "N", 2 => "U", 3 => "X"
  # FIRST_GENERATION: 0 => "Y", 1 => "N", 2 => "U", 3 => "X"

  # Public: Checks for an empty Profile
  #
  # Returns True if a Profile's gender field is blank. 
  def empty?
    gender.blank?
  end
end
