require 'rails_helper'

RSpec.feature 'New position creates new entry' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'all input is good' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_position_path
    fill_in 'Job title', with: 'Test Dev'
    fill_in 'Location', with: 'Text City'
    check 'remote'
    click_button "Create position"

    expect(page).to have_text("Position was successfully created.")
  end

  # Later add scenarios for bad input. Right now there can't really be bad input?
end