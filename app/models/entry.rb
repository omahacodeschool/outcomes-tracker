class Entry < ActiveRecord::Base
  belongs_to :user
  has_one :job_application
  has_one :offer
  accepts_nested_attributes_for :job_application, :offer
  #has_one :offer
  #has_one :position

  # name this better.
  def return_associated_info
    arr = []
    if self.job_application && self.job_application.job_title.blank? == false
      arr << "Application"
    elsif self.offer && self.offer.job_title.blank? == false
      arr << "Offer"
    end
    return arr.join(", ")
  end
  
end
