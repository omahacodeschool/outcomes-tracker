class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :job_application
  accepts_nested_attributes_for :job_application
  #has_one :offer
  #has_one :position
end
