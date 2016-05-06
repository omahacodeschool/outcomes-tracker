class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :application
  accepts_nested_attributes_for :application
  #has_one :offer
  #has_one :position
end
