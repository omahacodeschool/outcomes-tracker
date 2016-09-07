class Profile < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user

  # delegate :cohort, :to => :user

  # Public: Returns True if a Profile's gender field is blank. 
  def empty?
    gender.blank?
  end
end
