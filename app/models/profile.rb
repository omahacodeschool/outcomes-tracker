class Profile < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user

  # delegate :cohort, :to => :user
end
