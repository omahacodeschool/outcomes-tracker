class Company < ActiveRecord::Base
  has_many :entries
  has_many :hidings

  # Returns True if this company is hidden for the given user.
  def hidden_for_user?(user)
    user.hidings.where(company_id: id).any?
  end

  scope :permitted_for, -> (viewing_user) do
    joins("LEFT OUTER JOIN hidings ON companies.id = hidings.company_id")
    .select("companies.id, companies.name, hidings.user_id")
    .where("hidings.user_id IS NULL OR hidings.user_id != #{viewing_user.id}")
  end
end
