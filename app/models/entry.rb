class Entry < ActiveRecord::Base
  attr_accessor :company_name

  belongs_to :user
  belongs_to :company
  has_one :job_application
  has_one :offer
  has_one :position
  has_many :events
  accepts_nested_attributes_for :job_application, :offer, :events
  #has_one :offer
  #has_one :position

  # Internal: Set the entry's company association using a company's name. 
  # 
  # company_name - String name of the company.
  # persist      - Boolean for whether to save the record after setting.
  # 
  # Returns the updated Entry.
  def set_company_from_name(company_name, persist=true)
    self.company = Company.find_or_create_by(name: company_name)
    self.save if persist
  end

  def company_name=(input)
    set_company_from_name(input, false)
  end

  # Returns AR::Relation of Events, most recent first.
  def events_history
    events.includes(:user).persisted.order("created_at DESC")
  end

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
