require 'rails_helper'

RSpec.describe Profile, type: :model do
  it "belongs to a User" do
    user = User.create(name: "Testy", github_username: "test", email: "test@test.com")
    school = School.create(name: "Hogwarts")
    cohort = Cohort.create(name: "Mythical being", school_id: school.id)
    profile = Profile.create(user_id: user.id, cohort_id: cohort.id)
    assert_equal(user.id, profile.user.id)
  end

  it "belongs to a Cohort" do
    user = User.create(name: "Testy", github_username: "test", email: "test@test.com")
    school = School.create(name: "Hogwarts")
    cohort = Cohort.create(name: "Mythical being", school_id: school.id)
    profile = Profile.create(user_id: user.id, cohort_id: cohort.id)

    assert_equal(cohort.id, profile.cohort.id)
  end

  it "connects Cohorts and Users" do
    user = User.create(name: "Testy", github_username: "test", email: "test@test.com")
    school = School.create(name: "Hogwarts")
    cohort = Cohort.create(name: "Mythical being", school_id: school.id)
    profile = Profile.create(user_id: user.id, cohort_id: cohort.id)

    assert_equal(cohort.id, user.cohort.id)
  end
end
