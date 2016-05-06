require 'rails_helper'

RSpec.feature 'New entry creates new job application' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'all input is good' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_entry_path
    fill_in 'Company', with: 'Test'
    fill_in 'Job title', with: 'Test Dev'
    fill_in 'Location', with: 'Text City'
    fill_in 'Posting url', with: 'http://google.com'
    fill_in 'Company contact', with: 'Ms. Test'
    fill_in 'Notes', with: 'test notes'
    click_button "Create Entry"

    expect(page).to have_text("Entry was successfully created.")
  end

  # Later add scenarios for bad input. Right now there can't really be bad input?
end