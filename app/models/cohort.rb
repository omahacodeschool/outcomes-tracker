class Cohort < ActiveRecord::Base
  has_many :profiles
  has_many :users, through: :profiles

  scope :upcoming, -> {where("start_date > ?", Date.today).order(start_date: :asc)}

  def self.next
  	(upcoming.length > 0) ? upcoming[0] : nil
  end

end
