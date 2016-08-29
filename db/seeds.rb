ocs = School.create(name: "Omaha Code School")

Cohort.create([
  {name: "Agni", school_id: ocs.id},
  {name: "Budai", school_id: ocs.id},
  {name: "Cadejo", school_id: ocs.id},
  {name: "Drakon", school_id: ocs.id},
  {name: "Enfield", school_id: ocs.id},
  {name: "Fenrir", school_id: ocs.id},
  {name: "Gumiho", school_id: ocs.id}
])

sumeet = User.create(name: "Sumeet", github_username: "sumeetjain")
alex = User.create(name: "Alex", github_username: "halfghaninne")

sumeet.initialize_profile(7)
alex.initialize_profile(3)

Ability.create([
  {description: "can edit all user entries"},
  {description: "can view all user entries"},
  {description: "can export spreadsheet"}
])

# Permission.create([
#   {user_id: alex.id, ability_id: Ability.where(description: "can view all user entries")[0].id},
#   {user_id: sumeet.id, ability_id: Ability.where(description: "can view all user entries")[0].id},
#   {user_id: sumeet.id, ability_id: Ability.where(description: "can edit all user entries")[0].id}
# ])