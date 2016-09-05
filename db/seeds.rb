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

# Permission.create([
#   {user_id: alex.id, ability: 1},
#   {user_id: sumeet.id, ability: 1},
#   {user_id: sumeet.id, ability: 2}
# ])