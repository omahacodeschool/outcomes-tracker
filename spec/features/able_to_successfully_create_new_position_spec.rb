require 'rails_helper'

RSpec.feature 'Able to successfully create new position' do

  scenario 'all input is good' do
    visit new_position_path

      fill_in 'position_job_title', :with => 'web developer'
      fill_in 'position_salary_attributes_amount', :with => '50000'
      fill_in 'position_location', :with => 'Omaha'
      click_button 'Create Position'

    expect(page).to have_content 'Position was successfully created.'
  end

  # Later add scenarios for bad input. Right now there can't really be bad input?
end