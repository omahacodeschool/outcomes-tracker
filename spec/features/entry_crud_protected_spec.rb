require 'rails_helper'

RSpec.feature 'Entry is visible with right permissions' do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:student) { FactoryGirl.create(:user) }

  scenario 'user can view' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    ability = Ability.create(description:"can view all user entries")
    user.permissions.create(ability_id: ability.id)
    entry = student.entries.create(company:'Test')

    visit entry_path(entry.id)

    expect(page).to have_text("Test")
  end

  scenario 'user can edit' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    ability = Ability.create(description:"can edit all user entries")
    user.permissions.create(ability_id: ability.id)
    entry = student.entries.create(company:'Test')

    visit edit_entry_path(entry.id)

    expect(page).to have_text("Editing Entry")
  end


  scenario 'user cannot view' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    entry = student.entries.create(company:'Test')

    visit entry_path(entry.id)

    expect(page).to have_text("You cannot access that page")
  end

  scenario 'user cannot edit' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    entry = student.entries.create(company:'Test')

    visit edit_entry_path(entry.id)

    expect(page).to have_text("You cannot access that page")
  end

end