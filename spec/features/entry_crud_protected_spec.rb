require 'rails_helper'

RSpec.feature 'Entry is visible with right permissions' do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:student) { FactoryGirl.create(:user) }

  scenario 'user can view' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    ability_can_view = Ability.create(description:"can view all user entries")
    user.permissions.create(ability_id: ability_can_view.id)
    entry = student.entries.create(company:'Test')

    binding.pry

    visit entry_path(entry.id)

    expect(page).to have_text("Test")
  end

  # Later add scenarios for bad input. Right now there can't really be bad input?
end