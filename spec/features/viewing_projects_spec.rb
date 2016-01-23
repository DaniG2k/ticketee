require 'rails_helper'

RSpec.feature 'Users can view projects' do
  scenario 'with the project details' do
    sublime = 'Sublime Text 3'
    project = FactoryGirl.create :project, name: sublime

    visit '/'
    click_link sublime
    expect(page.current_url).to eq project_url(project)
  end  
end