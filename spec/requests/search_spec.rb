require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /index' do
    before do
      get search_path
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
