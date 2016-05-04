class Entry < ActiveRecord::Base
  belongs_to :user
  #has_one :application
  #has_one :offer
  #has_one :position
end
