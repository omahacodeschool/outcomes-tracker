class User < ActiveRecord::Base
  has_many :entries
  has_one :profile
  has_many :abilities, through: :permissions

  delegate :cohort, :to => :profile

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(github_username: auth_hash['info']['nickname']) #in tutorial and previous apps there was another argument / model attribute here for provider. I removed this because my thought is that we wont need multiple providers ever. I may be thinking about this incorrectly.
    # user.name = auth_hash['info']['name'] # don't like this because not all students will have their full name on GH and it looks like this would rewrite on every log in
    user.image_url = auth_hash['info']['image']
    user.save!
    user
  end

end
