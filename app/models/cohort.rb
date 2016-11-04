class Cohort < ActiveRecord::Base
  has_many :profiles
  has_many :users, through: :profiles

  def self.next
  	(upcoming.length > 0) ? upcoming[0].id : nil
  end

  def self.upcoming
  	Cohort.where("start_date > ?", Date.today).order(start_date: :asc)
  end

end
