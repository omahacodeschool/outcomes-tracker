class JobApplication < ActiveRecord::Base
  belongs_to :entry 
  accepts_nested_attributes_for :entry

  # not sure if syntax is right.
  delegate :user_id, to: :entry

  enum nature_of_employment: {"internship" => 0, "apprenticeship" => 1, 
                              "freelance/contract" => 2, "part-time" => 3, 
                              "full-time" => 4, "self-employed" => 5}

  #theres gotta be a better way to do this. but for now:
  def self.retrieve_all_for_user(user)
    entries = Entry.where(user_id: user.id)
    collection = []
    entries.each do |entry|
      if entry.job_application
        collection << entry.job_application
      end
    end
    return collection
  end

end
