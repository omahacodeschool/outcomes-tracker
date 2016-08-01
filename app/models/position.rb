class Position < ActiveRecord::Base
  belongs_to :entry
  has_one :salary

  accepts_nested_attributes_for :entry, :salary
end
