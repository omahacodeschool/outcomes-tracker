class User < ActiveRecord::Base
  has_many :entries
  has_one :profile
  has_one :cohort, through: :profile
  has_many :permissions
  has_many :events
  accepts_nested_attributes_for :profile
  has_many :hidings
  # accepts_nested_attributes_for :permissions

  has_many :job_applications, through: :entries
  has_many :offers, through: :entries
  has_many :positions, through: :entries

  delegate :cohort, :to => :profile
  delegate :resume, to: :profile
  delegate :personal_website, to: :profile
  delegate :linked_in, to: :profile
  delegate :twitter, to: :profile
  # delegate :name, :to => :profile

  def cohort_id
    @cohort_id ||= self.profile.try(:cohort_id)
  end

  # For every param key passed to User.new, Rails runs a 
  # setter method named after that key. Most of these are 
  # default AR setter methods but it will also run this:

  def cohort_id=(input)
    self.build_profile(cohort_id: input)
  end

  # Public: Checks if a User's candidate Profile is blank
  #
  # Returns True if one of the required Profile fields is blank
  def missing_candidate_profile
    resume.blank? || linked_in.blank?
  end

  # Public: Build a profile stub to avoid errors. Defaults to 7 (for Gumiho).
  def initialize_profile(c=7)
    self.create_profile(cohort_id: c)
  end

  # Public: Authenticates user via omniauth/GitHub
  #
  # auth_hash - Authentication hash from GitHub
  #
  # Returns User object
  def self.from_omniauth(auth_hash)
    user = find_or_create_by(github_username: auth_hash['info']['nickname'])
    user.image_url = auth_hash['info']['image']
    user.save!
    user
  end

  # Public: Checks GitHub username against the database.
  #
  # auth_hash - Authentication hash from GitHub
  #
  # Returns true if a User with the auth_hash's username exists in the database
  def self.check_user_access(auth_hash)
    return self.find_by(github_username: auth_hash['info']['nickname'])
  end

  # Public: Returns True if User is an admin.
  def admin?
    has_view_permission || has_edit_permission
  end

  # Internal: Gives User object the Permission to view all Users' Entries
  def set_view_permission
    if self.has_view_permission == false
      p = self.permissions.create({ability: 1})
    end
  end

  # Internal: Gives User object the Permission to edit all Users' Entries
  def set_edit_permission
    if self.has_edit_permission == false
      p = self.permissions.create({ability: 2})
    end
  end

  # Internal: Removes the Permission to view all Users' Entries from a User
  def remove_view_permission
    if self.has_view_permission == true
      permissions = self.permissions.where(ability: 1)
      # In best-use case, return of the above query should always be a single record, but not assured by application; and I'm not sure that there is a way to add such a validation on the table. 
      permissions.destroy_all
    end
  end

  # Internal: Removes the Permission to edit all Users' Entries from a User
  def remove_edit_permission
    if self.has_edit_permission == true
      permissions = self.permissions.where(ability: 2)
      permissions.destroy_all
    end
  end

  # Internal: Returns a collection of all Permission abilities for a User
  def return_list_of_abilities
    ability_descriptions = []
    self.permissions.each do |permission|
      ability_descriptions << permission.ability
    end
    ability_descriptions
  end

  # Internal: Returns True if a User's Permsissions includes the Permission 
  #   to view all Users' Entries.
  #
  # Returns a collection of admins -- Users with view permission
  def self.admins
    User.joins(:permissions).where({permissions: {ability: 1}})
  end

  # Returns True if user is an admin.
  def admin?
    has_view_permission || has_edit_permission
  end

  def has_view_permission 
    self.return_list_of_abilities.include?("can view all user entries")
  end

  # Internal: Returns True if a User's Permsissions includes the Permission 
  #   to edit all Users' Entries.
  def has_edit_permission 
    self.return_list_of_abilities.include?("can edit all user entries")
  end

end
