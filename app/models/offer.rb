class Offer < ActiveRecord::Base
  belongs_to :entry
  has_one :salary
  accepts_nested_attributes_for :entry

  enum nature_of_employment: {"internship" => 0, "apprenticeship" => 1, 
                              "freelance/contract" => 2, "part-time" => 3, 
                              "full-time" => 4, "self-employed" => 5}
                              
  #theres gotta be a better way to do this. but for now:
  def self.retrieve_all_for_user(user)
    entries = Entry.where(user_id: user.id)
    collection = []
    entries.each do |entry|
      if entry.offer
        collection << entry.offer
      end
    end
    return collection
  end
end
