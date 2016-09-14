class Company < ActiveRecord::Base
  has_many :entries
  has_many :hidings

  # Returns True if this company is hidden for the given user.
  def hidden_for_user?(user)
    user.hidings.where(company_id: id).any?
  end
end
