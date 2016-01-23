require 'rails_helper'

RSpec.feature 'Users can delete projects' do
  scenario 'successfully' do
    sublime = 'Sublime Text 3'
    FactoryGirl.create(:project, name: sublime)

    visit '/'
    click_link sublime
    click_link 'Delete Project'

    expect(page).to have_content 'Project has been deleted.'
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content(sublime)
  end
end