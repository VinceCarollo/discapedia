require 'rails_helper'

RSpec.describe 'Discs', type: :request do
  let(:disc) { create(:disc) }

  describe 'GET /discs/:manufacturer_slug/:slug' do
    it 'renders a successful response' do
      get manufacturer_disc_path(disc.manufacturer.slug, disc.slug)
      expect(response).to be_successful
    end
  end
end
