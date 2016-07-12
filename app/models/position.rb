class Position < ActiveRecord::Base

  accepts_nested_attributes_for :entry
end
