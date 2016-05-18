# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 

sumeet = User.create(name: "Sumeet", github_username: "sumeetjain")
alex = User.create(name: "Alex", github_username: "halfghaninne")

abilities = Ability.create([
  {description: "can edit all user entries"},
  {description: "can view all user entries"},
  {description: "can export spreadsheet"}
])

permissions = Permission.create([
  {user_id: alex.id, ability_id: Ability.where(description: "can view all user entries")[0].id},
  {user_id: sumeet.id, ability_id: Ability.where(description: "can view all user entries")[0].id},
  {user_id: sumeet.id, ability_id: Ability.where(description: "can edit all user entries")[0].id}
])

ocs = School.create(name: "Omaha Code School")

cadejo = Cohort.create(name: "Cadejo", school_id: ocs.id)

Profile.create(user_id: alex.id, cohort_id: cadejo.id, gender: "female")

Entry.create(user_id: alex.id, company: "Omaha World Herald", job_application_attributes: {location: "Omaha", job_title: "Data Journalist"})

Entry.create(user_id: alex.id, company: "Omaha Code School", offer_attributes: {location: "Omaha", job_title: "TA"})

