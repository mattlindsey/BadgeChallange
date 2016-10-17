require 'rails_helper'

RSpec.feature 'Home', :type => :feature, js: true do
  scenario 'should not have JavaScript errors' do
    visit('/videos')
    expect(page).not_to have_errors
  end
end
