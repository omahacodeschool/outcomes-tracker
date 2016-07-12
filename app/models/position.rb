class Position < ActiveRecord::Base
  belongs_to :entry

  accepts_nested_attributes_for :entry
end
