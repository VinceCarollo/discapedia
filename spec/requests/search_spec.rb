require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /index' do
    let(:params) do
      { q: 'test', sort_by: 'name', sort_direction: 'asc' }
    end
    let(:search_service_params) do
      { query: params[:q], sort_by: params[:sort_by], sort_direction: params[:sort_direction] }
    end

    before do
      allow(SearchService).to receive(:call).with(search_service_params)
      get search_path, params:
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'calls search service' do
      expect(SearchService).to have_received(:call).once.with(search_service_params)
    end

    it 'renders the index template' do
      expect(response).to render_template(:index)
    end

    it 'does not render the layout' do
      expect(response).to render_template(layout: false)
    end
  end
end
