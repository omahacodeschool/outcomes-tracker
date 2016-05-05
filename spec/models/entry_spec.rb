require 'rails_helper'

RSpec.describe Entry, type: :model do
  it "belongs to a user" do
    user = User.create(name: "Testy", github_username: "test", email: "test@test.com")
    entry = Entry.create(user_id: user.id, company: "Test Factory")
    assert_equal(user, entry.user)
  end
end
