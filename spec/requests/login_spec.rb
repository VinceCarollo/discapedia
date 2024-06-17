require 'rails_helper'

RSpec.describe 'Logins', type: :request do
  describe 'GET /index' do
    it 'returns ok' do
      get login_path
      expect(response).to have_http_status(:ok)
    end

    context 'if logged in' do
      before do
        allow(User).to receive(:exists?).and_return(true)
      end

      it 'redirects to the admin discs path' do
        get login_path
        expect(response).to redirect_to(admin_discs_path)
      end
    end
  end

  describe 'POST /create' do
    let(:user) { instance_double(User, id: 1) }

    before do
      allow(User).to receive(:find_by).and_return(user)
      allow(user).to receive(:authenticate).and_return(true)
    end

    it 'redirects to the admin discs path' do
      post login_path, params: { username: 'admin', password: 'password' }
      expect(response).to redirect_to(admin_discs_path)
    end

    context 'with invalid credentials' do
      before do
        allow(user).to receive(:authenticate).and_return(false)
      end

      it 'renders the new template' do
        post login_path, params: { username: 'admin', password: 'password' }
        expect(response).to render_template(:new)
      end
    end
  end
end
