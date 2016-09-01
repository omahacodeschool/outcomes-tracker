class User < ActiveRecord::Base
  has_many :entries
  has_one :profile
  has_many :permissions

  # accepts_nested_attributes_for :permissions

  has_many :job_applications, through: :entries

  delegate :cohort, :to => :profile

  # delegate :name, :to => :profile

  # Build a profile stub to avoid errors. Defaults to 7 (for Gumiho).
  def initialize_profile(c=7)
    self.create_profile(cohort_id: c)
  end

  def self.from_omniauth(auth_hash)
    user = find_or_create_by(github_username: auth_hash['info']['nickname']) #in tutorial and previous apps there was another argument / model attribute here for provider. I removed this because my thought is that we wont need multiple providers ever. I may be thinking about this incorrectly.
    # user.name = auth_hash['info']['name'] # don't like this because not all students will have their full name on GH and it looks like this would rewrite on every log in
    user.image_url = auth_hash['info']['image']
    user.save!
    user
  end

  def set_view_permission
    if self.has_view_permission == false
      p = self.permissions.build({ability: 1})
      p.save
    end
  end

  def set_edit_permission
    if self.has_edit_permission == false
      p = self.permissions.build({ability: 2})
      p.save
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
    if self.return_list_of_abilities.include?("can view all user entries")
      # Changing to enums does not change the need to do a check against a string here, which still feels weird. Maybe it doesn't need to feel weird.
      true
    else
      false
    end
  end

  def has_edit_permission 
    if self.return_list_of_abilities.include?("can edit all user entries")
      true
    else
      false
    end
  end

end
