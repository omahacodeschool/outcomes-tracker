class Offer < ActiveRecord::Base
  belongs_to :entry
  accepts_nested_attributes_for :entry

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
