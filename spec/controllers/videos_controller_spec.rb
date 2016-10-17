require 'rails_helper'

RSpec.describe VideosController, type: :controller do

    it 'should show the video' do
      video = Video.create! name: 'Anyname'
      get :show, id: video.id  # or visit videos_path
      expect(response).to have_http_status(:success)
      #expect(page).to have_content(video.name)
    end

end
