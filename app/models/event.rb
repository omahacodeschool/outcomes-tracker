class Event < ActiveRecord::Base
  belongs_to :entry

  scope :persisted, -> { where "id IS NOT NULL" }
end
