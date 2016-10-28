require 'rails_helper'

RSpec.feature 'Able to successfully create new position' do

	let(:student) { FactoryGirl.create(:user) }

  scenario 'all input is good' do
  	allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(student)
    visit new_translation_path

    fill_in 'project_name', :with => 'Test Project'
    fill_in 'input_text', :with => 'This is an example sentence.'
    click_button 'Submit'

    expect(page).to have_content 'Translation request submitted.'
    expect(Translation.last.project.name).to be "Test Project"
  end

end