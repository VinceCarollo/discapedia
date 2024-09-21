require 'rails_helper'

RSpec.describe Admin::LoginController do
  let(:user) { instance_double(User, id: 3) }

  describe '#GET new' do
    context 'when user exists' do
      before do
        allow(User).to receive(:exists?).and_return(true)
        get :new, session: { user_id: 3 }
      end

      it 'redirects to admin_discs_path' do
        expect(response).to redirect_to(admin_discs_path)
      end
    end

    context 'when user does not exist' do
      before do
        allow(User).to receive(:exists?).and_return(false)
        get :new
      end

      it 'renders new' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#POST create' do
    context 'when user exists' do
      before do
        allow(User).to receive(:find_by).and_return(user)
        allow(user).to receive(:authenticate).and_return(true)
        post :create, params: { username: 'vince', password: 'password' }
      end

      it 'redirects to admin_discs_path' do
        expect(response).to redirect_to(admin_discs_path)
      end

      it 'sets session[:user_id]' do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context 'when user does not exist' do
      before do
        allow(User).to receive(:find_by).and_return(nil)
        post :create, params: { username: 'vince', password: 'password' }
      end

      it 'renders new' do
        expect(response).to render_template(:new)
      end

      it 'sets flash.now[:error]' do
        expect(flash.now[:error]).to eq('Invalid username or password')
      end
    end
  end
end
