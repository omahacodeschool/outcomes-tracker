class User < ActiveRecord::Base
  has_many :entries
  has_one :profile
  has_many :permissions
  has_many :abilities, through: :permissions

  has_many :job_applications, through: :entries

  delegate :cohort, :to => :profile

  # delegate :name, :to => :profile

  # Build a profile stub to avoid errors. Defaults to 7 (for Gumiho).
  def initialize_profile(c=7)
    self.create_profile(cohort_id: c)
  end

  # change method name to be more descriptive
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(github_username: auth_hash['info']['nickname']) #in tutorial and previous apps there was another argument / model attribute here for provider. I removed this because my thought is that we wont need multiple providers ever. I may be thinking about this incorrectly.
    # user.name = auth_hash['info']['name'] # don't like this because not all students will have their full name on GH and it looks like this would rewrite on every log in
    user.image_url = auth_hash['info']['image']
    user.save!
    user
  end

  # Checks GitHub username against the database.
  #
  # auth_hash - Authentication hash from GitHub
  #
  # Returns true if a User with the auth_hash's username exists in the database
  def self.check_user_access(auth_hash)
    return self.find_by(github_username: auth_hash['info']['nickname'])
  end

  def return_abilities_array
    ability_descriptions = []
    self.abilities.each do |ability|
      ability_descriptions << ability.description
    end
    ability_descriptions
  end

  def has_view_permission 
    if self.return_abilities_array.include?("can view all user entries")
      # this still feels yucky because the ability description is hard-coded. having trouble of thinking how to best reference the specific ability for a given user-flow.
      true
    else
      false
    end
  end

  def has_edit_permission 
    if self.return_abilities_array.include?("can edit all user entries")
      true
    else
      false
    end
  end

end
