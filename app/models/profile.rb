class Profile < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user

  # delegate :cohort, :to => :user

  #Returns True if a Profile's gender field == an arbitrary value -- is blank. 
  def empty?
    gender.blank?
  end
end
