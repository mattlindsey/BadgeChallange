require 'rails_helper'

RSpec.feature "Video Manipulation", :type => :feature , :js => true do
  scenario 'showing a video' do
    company = Company.create! name: 'ACME'
    user = User.create! name: 'John', company: company
    video = Video.create! name: 'Anyname'
    visit log_in_path(user)
    visit video_path(video)
    click_on('Watch Me!')
    expect(page).to have_content('[VIDEO SCREEN]')
   end
end