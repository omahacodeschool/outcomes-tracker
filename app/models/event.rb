class Event < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user

  scope :persisted, -> { where "id IS NOT NULL" }
end
