ocs = School.create(name: "Omaha Code School")

Cohort.create([
  {name: "Agni", school_id: ocs.id},
  {name: "Budai", school_id: ocs.id},
  {name: "Cadejo", school_id: ocs.id},
  {name: "Drakon", school_id: ocs.id},
  {name: "Enfield", school_id: ocs.id},
  {name: "Fenrir", school_id: ocs.id},
  {name: "Gumiho", school_id: ocs.id},
  {name: "Huma", school_id: ocs.id}
])

sumeet = User.create(name: "Sumeet", github_username: "sumeetjain", email: "sumeet@omahacodeschool.com", slack_username: "sumeetjain")
alex = User.create(name: "Alex", github_username: "halfghaninne", email: "alex@omahacodeschool.com", slack_username: "alexandramillatmal")

sumeet.initialize_profile(7)
alex.initialize_profile(3)