require 'rails_helper'

RSpec.describe Permission, type: :model do
  it "links Users to Abilities" do 
    user = User.create(name: "Testy", github_username: "test", email: "test@test.com")
    ability = Ability.create(description: "can do the thing")
    Permission.create(user_id: user.id, ability_id: ability.id)
    expect(user.abilities.count).to eq(1)
  end
end