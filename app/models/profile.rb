class Profile < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :user

  # delegate :cohort, :to => :user

  # Validate these on update, so that new user creation doesn't fail.
  validates :resume, presence: true, on: :update
  validates :resume, format: { with: URI.regexp }, on: :update

  validates :linked_in, presence: true, on: :update
  validates :linked_in, format: { with: URI.regexp }, on: :update

  validates :personal_website, presence: true, on: :update
  validates :personal_website, format: { with: URI.regexp }, on: :update

  validates :twitter, format: { with: /\A(-|\w)*\z/i }, on: :update

  def empty?
    gender.blank?
  end
end
