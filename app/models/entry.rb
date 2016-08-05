class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :job_application
  has_one :offer
  has_one :position
  accepts_nested_attributes_for :job_application, :offer
  #has_one :offer
  #has_one :position

  # name this better.
  def return_associated_info
    arr = []
    if self.job_application && self.job_application.job_title.blank? == false
      arr << "Application"
    end
    if self.offer && self.offer.job_title.blank? == false
      arr << "Offer"
    end
    return arr.join(", ")
  end

  # minimize / combine this and the following method at a later time
  def self.all_without_offer
    arr = []
    self.all.each do |entry|
      if entry.job_application && !entry.offer
        arr << entry
      end
    end
    return arr
  end

  # minimize / combine this and the above method at a later time
  def self.all_without_position
    arr = []
    self.all.each do |entry|
      if entry.offer && !entry.position
        arr << entry
      end  
    end
    return arr  
  end

end
