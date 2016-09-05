class User < ActiveRecord::Base
  has_many :entries
  has_one :profile
  has_many :permissions

  # accepts_nested_attributes_for :permissions

  has_many :job_applications, through: :entries
  has_many :offers, through: :entries
  has_many :positions, through: :entries


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

  def set_view_permission
    if self.has_view_permission == false
      p = self.permissions.create({ability: 1})
    end
  end

  def set_edit_permission
    if self.has_edit_permission == false
      p = self.permissions.create({ability: 2})
    end
  end

  def remove_view_permission
    if self.has_view_permission == true
      permissions = self.permissions.where(ability: 1)
      # In best-use case, return of the above query should always be a single record, but not assured by application; and I'm not sure that there is a way to add such a validation on the table. 
      permissions.destroy_all
    end
  end

  def remove_edit_permission
    if self.has_edit_permission == true
      permissions = self.permissions.where(ability: 2)
      permissions.destroy_all
    end
  end

  def return_list_of_abilities
    ability_descriptions = []
    self.permissions.each do |permission|
      ability_descriptions << permission.ability
    end
    ability_descriptions
  end

  def has_view_permission 
    self.return_list_of_abilities.include?("can view all user entries")
  end

  def has_edit_permission 
    self.return_list_of_abilities.include?("can edit all user entries")
  end

end
